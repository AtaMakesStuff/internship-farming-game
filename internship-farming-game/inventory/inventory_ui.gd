extends Control

@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

var base_vector = 0
var active_queue = 0

func _ready ():
	inventory.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()

func open():
	visible = true
	is_open = true 

func close():
	visible = false
	is_open = false

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
