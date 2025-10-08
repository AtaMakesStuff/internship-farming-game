extends Control

signal new_active_queue_amount(int)
var active_queue_holder
@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@export var is_open = false
# I1
# below variable breaks in any scene that isn't testing 
@onready var ui_node = $"../../CanvasLayer/inventory_ui"
var slot_number_to_be_removed: int 
signal to_remove_slot_number(data: int)

# I2
@export var is_main_inventory = false 


func _ready ():
	# I1
	# tried using gropus to get inventory_ui specifically 
	#await get_tree().create_timer(0.05).timeout
	#ui_node = get_tree().get_first_node_in_group("InventoryUI")
	inventory.update.connect(update_slots)
	update_slots()

func update_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
			update_slots()
		else:
			open()
			update_slots()
		# I1
		# working on hiding active slots when main inventory is open
		# currently works but is based on pathway to inventory in testing scene
		# so it breaks in any other scene
		if ui_node.is_open:
			hide_active()
			GameState.enter_menu()
		else:
			show_active()
			GameState.enter_playing()
# I2
# working on decreasing amount
	if Input.is_action_just_pressed("drop_item"):
		if !is_main_inventory and GameState.check_playing():
			decrease_slot()
		update_slots()
		remove_item()

func open():
	visible = true
	is_open = true 


func close():
	visible = false
	is_open = false
	# I3
	#GameState.current_game_state = GameState.Game_State.MENU


func initialize_active_inventory():
	inventory.slots[0].is_active = true
	update_slots()

# I1
# working on hiding active slots when main inventory screen is open
func hide_active():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].deactivate(inventory.slots[i])

# I1
func show_active():
	for i in range(min(inventory.slots.size(), slots.size())):
		update_slots()

# I2
# work on decreasing amount
func decrease_slot():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].decrease(inventory.slots[i])

# I2
func remove_item():
	for i in range(min(inventory.slots.size(), slots.size())):
		if inventory.slots[i].to_be_removed == true:
			slot_number_to_be_removed = i
			to_remove_slot_number.emit(slot_number_to_be_removed)
			inventory.slots[i].to_be_removed = false


# trying to handle scrolling equating moving the active slot
# maybe do incrementation based on delta?
"""
func _input(event):
	if event is InputEventPanGesture:
		if active_queue >0:
			if event.delta.x > 0:
				active_queue =+ 1
			else:
				active_queue =+ 1
"""


func _on_grid_container_send_active_queue(data: int) -> void:
	active_queue_holder = slots[data]
