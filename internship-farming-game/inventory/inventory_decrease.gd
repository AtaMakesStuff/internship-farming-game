extends Sprite2D

signal slot_clicked
@onready var ui_node = $"../../../../../../CanvasLayer/inventory_ui"

func _input(event):
	if ui_node.is_open:
		if event is InputEventMouseButton and event.pressed:
			if get_rect().has_point(to_local(event.position)):
				print("clicked!") 
			slot_clicked.emit()
