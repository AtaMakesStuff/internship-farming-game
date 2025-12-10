extends Node

enum Game_State {PLAYING, TALKING, MENU}
var current_game_state = Game_State.PLAYING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter_playing():
	current_game_state = Game_State.PLAYING

func enter_talking():
	pass 

func enter_menu():
	pass 

func check_playing():
	if current_game_state == Game_State.PLAYING:
		return true
	else: 
		return false 

func check_talking():
	pass 

func check_menu():
	pass  
