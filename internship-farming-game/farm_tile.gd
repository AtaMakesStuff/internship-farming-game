extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
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
