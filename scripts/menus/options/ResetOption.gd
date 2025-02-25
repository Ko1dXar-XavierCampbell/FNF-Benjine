extends Label

const CONFIRM_DIALOGUE = "You sure? (Game will restart.)"

@export var reset_scores: bool = false
@export var reset_settings: bool = false

var original_text = ""
var primed = false

func _ready():
	original_text = text

func on_input(event: InputEvent):
	if event.is_action("ui_accept"):
		if !primed:
			primed = true
			text = CONFIRM_DIALOGUE
			return
		
		var dir = DirAccess.new()
		
		if reset_scores:
			dir.remove(UserData.SAVE_DATA_PATH)
		if reset_settings:
			dir.remove(UserData.SETTINGS_DATA_PATH)
		
		UserData._ready()
		get_tree().change_scene_to_file(ProjectSettings.get_setting("application/run/main_scene"))

func unprime():
	primed = false
	text = original_text
