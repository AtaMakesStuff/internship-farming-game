extends Control

@export var inventory = []
@export var inventoryLimit = 2
@export var visibleInventory = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$background.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("inventory"):
		if $background.visible:
			$background.hide()
		else:
			$background.show()

func _on_add_item_pressed() -> void:
	if inventory.size() < inventoryLimit:
		var newItem = ColorRect.new()
		newItem.color = Color(randf(), randf(), randf())
		newItem.set_name("ColorRect" + str(inventory.size()))
		inventory.append(newItem)
		print(inventory)
