extends InventoryItem

class_name Seed

enum Growth_State {SEED, SPROUT, HARVESTABLE}
@export var current_growth_state = Growth_State.SEED
@export var days_to_grow: int 
@export var day_growing: int
@export var growable_seasons = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
