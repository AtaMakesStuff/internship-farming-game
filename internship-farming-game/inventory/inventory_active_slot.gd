extends GridContainer


@onready var inventory_ui = $"../../../../CanvasLayer/inventory_ui"
var active_queue = 0
var min_active_inventory = 0
var max_active_inventory = 4

# Called when the node enters the scene tree for the first time.
# MAKE THE FIRST SPOT ACTIVE SOMEHOW
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !inventory_ui.is_open:
		if Input.is_action_just_pressed("inventoryRight"):
			if active_queue < max_active_inventory:
				active_queue += 1
				get_parent().get_parent().inventory.slots[active_queue - 1].is_active = false
			elif active_queue == max_active_inventory:
				active_queue = min_active_inventory
				get_parent().get_parent().inventory.slots[max_active_inventory].is_active = false
			get_parent().get_parent().inventory.slots[active_queue].is_active = true
			get_parent().get_parent().update_slots()
		
	if Input.is_action_just_pressed("inventoryLeft"):
		if !inventory_ui.is_open:
			if active_queue	> min_active_inventory:
				active_queue -= 1
				get_parent().get_parent().inventory.slots[active_queue + 1].is_active = false
			elif active_queue == min_active_inventory:
				active_queue = max_active_inventory
				get_parent().get_parent().inventory.slots[min_active_inventory].is_active = false
			get_parent().get_parent().inventory.slots[active_queue].is_active = true
			get_parent().get_parent().update_slots()
