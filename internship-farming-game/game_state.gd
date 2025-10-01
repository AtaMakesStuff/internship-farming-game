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
	current_game_state = Game_State.TALKING

func enter_menu():
	current_game_state = Game_State.MENU

func check_playing():
	if current_game_state == Game_State.PLAYING:
		return true
	else: 
		return false 

func check_talking():
	if current_game_state == Game_State.TALKING:
		return true 
	else: 
		return false 

func check_menu():
	if current_game_state == Game_State.MENU:
		return true 
	else: 
		return false 
