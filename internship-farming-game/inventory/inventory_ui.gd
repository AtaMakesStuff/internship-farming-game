extends Control

signal new_active_queue_amount(int)
@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@export var is_open = false
@onready var ui_node = $"../../CanvasLayer/inventory_ui"


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
		if ui_node.is_open:
			hide_active()
		else:
			show_active()

# NOTE work in hiding active slot
func open():
	visible = true
	is_open = true 


func close():
	visible = false
	is_open = false

func initialize_active_inventory():
	inventory.slots[0].is_active = true
	update_slots()

func hide_active():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].deactivate(inventory.slots[i])

func show_active():
	for i in range(min(inventory.slots.size(), slots.size())):
		update_slots()

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
