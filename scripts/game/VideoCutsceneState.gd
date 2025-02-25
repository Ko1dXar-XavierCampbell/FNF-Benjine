extends VideoStreamPlayer

@export var package_name: String
@export var video_name: String

@onready var lvl_manager = get_parent()
@onready var html5_err = $HTML5_Error

func _ready():
	TransitionSystem.reset()
	
	if OS.get_name() == "HTML5":
		html5_err.show()
		get_tree().create_timer(3).connect("timeout", Callable(self, "_on_cutscene_finished").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
		return
	
	stream = load("res://packages/" + package_name + "/resources/videos/" + video_name + ".webm")
	play()

func _on_cutscene_finished():
	if !lvl_manager.in_last_state():
		TransitionSystem.play_transition(TransitionSystem.Transitions.SCREEN_CAP_OUT)
	
	# Current assumption: video ends in a natural manner, no fade out required
	lvl_manager.go_to_next_state()
