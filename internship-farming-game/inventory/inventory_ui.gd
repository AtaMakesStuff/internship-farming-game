extends Control

signal new_active_queue_amount(int)
@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@export var is_open = false
# I1
# below variable breaks in any scene that isn't testing 
# try out acess as unique name 
#@onready var ui_node = $"../../CanvasLayer/inventory_ui"


func _ready ():
	inventory.update.connect(update_slots)
	update_slots()

func update_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()
		#if GameState.current_game_state == GameState.Game_State.
		# I1
		# working on hiding active slots when main inventory is open
		# currently works but is based on pathway to inventory in testing scene
		# so it breaks in any other scene
		#if ui_node.is_open:
			#hide_active()
		#else:
			#show_active()
# I2
# working on decreasing amount
#	if Input.is_action_just_pressed("drop_item"):
#		if !ui_node.is_open:
#			decrease_slot()
#			update_slots()

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
#func hide_active():
	#for i in range(min(inventory.slots.size(), slots.size())):
		#slots[i].deactivate(inventory.slots[i])

# I1
#func show_active():
	#for i in range(min(inventory.slots.size(), slots.size())):
		#update_slots()

# I2
# work on decreasing amount
#func decrease_slot():
#	for i in range(min(inventory.slots.size(), slots.size())):
#		slots[i].decrease(inventory.slots[i])

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
