extends Control

@onready var day_text = $DayText
var current_day = 1
var max_day = 7
@onready var day_otw_text = $DayOtwText
var day_otw_state = GameState.current_day_otw_state
@onready var year_text = $YearText
var current_year = 1
@onready var season_text = $SeasonText
var season_state = GameState.current_season_state
@onready var time_text = $TimeText
var current_time = 0.00

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_text.text = str(current_day)
	set_day_otw()
	year_text.text = str(current_year)
	set_season()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass 

func advance_day():
	if current_day == max_day:
		current_day = 1
	else:
		current_day += 1
	day_text.text = str(current_day)

func set_day_otw():
	if day_otw_state == 1:
		day_otw_text.text = "Tue"
	elif day_otw_state == 2:
		day_otw_text.text = "Wed"
	elif day_otw_state == 3:
		day_otw_text.text = "Thu"
	elif day_otw_state == 4:
		day_otw_text.text = "Fri"
	elif day_otw_state == 5:
		day_otw_text.text = "Sat"
	elif day_otw_state == 6:
		day_otw_text.text = "Sun"
	else:
		day_otw_text.text = "Mon"

func advance_day_otw():
	GameState.change_day_otw() 
	day_otw_state = GameState.current_day_otw_state
	set_day_otw()

func advance_year():
	current_year += 1
	year_text.text = str(current_year)

func set_season():
	if season_state == 0:
		season_text.text = "Spr"
	elif season_state == 1:
		season_text.text = "Sum"
	elif season_state == 2:
		season_text.text = "Aut"
	else: 
		season_text.text = "Win"

func advance_season():
	GameState.change_season()
	season_state = GameState.current_season_state
	set_season()

func end_day():
	if current_day == max_day && season_state == GameState.Season_State.WINTER:
		advance_year()
	if current_day == max_day:
		advance_season()
	advance_day_otw()
	advance_day()

func _on_testing_time_pressed() -> void:
	advance_day()


func _on_testing_time_2_pressed() -> void:
	advance_day_otw()


func _on_testing_time_3_pressed() -> void:
	advance_year()


func _on_testing_time_4_pressed() -> void:
	advance_season()


func _on_testing_time_5_pressed() -> void:
	end_day()
