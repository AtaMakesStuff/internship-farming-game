extends RichTextLabel

signal dialogue_finished 

@export var lines = []
var lines_counter = 0
var displayed_text = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var holder = ""
	for n in range(0,lines[lines_counter].length(),+1):
		holder += (lines[lines_counter][n])
		text = holder
		await get_tree().create_timer(0.05).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
# add a canClick boolean in the loop to prevent loop breaking 
# each time you click while a line is running 
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("leftClick") :
		if lines_counter < lines.size():
			lines_counter += 1
		var holder = ""
		if lines_counter < lines.size():
			for n in range(0,lines[lines_counter].length(),+1):
				holder += (lines[lines_counter][n])
				text = holder
				await get_tree().create_timer(0.05).timeout
		else:
			dialogue_finished.emit()

# working version
# copy in case above breaks 
"""
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("leftClick") :
		if lines_counter <4:
			lines_counter += 1
		else:
			lines_counter = 0
		var holder = ""
		for n in range(0,lines[lines_counter].length(),+1):
			holder += (lines[lines_counter][n])
			text = holder
			await get_tree().create_timer(0.05).timeout
"""
