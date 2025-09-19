extends Area2D

@export var item: InventoryItem
var player = SceneMultiplayer

var is_player_inside = false

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.name == "player":
		is_player_inside = true
		player = body

func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	if body.name == "player":
		is_player_inside = false

# when player clicks on farm tile and is nearby
# turn farm tile into tilled texture 
func _input(event):
	if event is InputEventMouseButton and event.pressed and is_player_inside and $"../CanvasLayer2/inventory_hotbar_ui".slots[$"../CanvasLayer2/inventory_hotbar_ui/NinePatchRect/GridContainer".active_queue].name == "hoe":
		var tex = $CollisionShape2D.shape
		if tex == null:
			return
		
		var sprite_size = tex.get_size() * scale
		var top_left = global_position - sprite_size / 2.0
		var mouse_pos = get_global_mouse_position()
		var sprite_rect = Rect2(top_left, sprite_size)
		
		if sprite_rect.has_point(mouse_pos):
			$ColorRect.hide()
			$ColorRect2.show()

#experimenting with making farm tile harvestable
"""
func make_harvestable():
	var harvest_instance = hoe.instantiate()
	harvest_instance.rotation = rotation
	harvest_instance.global_position = $farm_tile.global_position
	get_parent().add_child(harvest_instance)
	player.collect(item)
	

func _on_make_harvestable_pressed() -> void:
	make_harvestable()
"""
