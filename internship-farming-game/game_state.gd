extends Node

enum Game_State {PLAYING, TALKING, MENU}
var current_game_state = Game_State.PLAYING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_menu():
	current_game_state = Game_State.MENU
