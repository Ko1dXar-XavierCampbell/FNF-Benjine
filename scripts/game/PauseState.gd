extends CanvasLayer

const OPTIONS_UI = preload("res://scenes/shared/menus/options/OptionsUI.tscn")

@export var pause_menu_path: NodePath = NodePath("PauseMenu")

@onready var pause_menu = get_node(pause_menu_path)

@onready var pause_music = $Pause_Music
@onready var music_tween = $Music_Tween
@onready var options_notice_anim = $Options_Notice/AnimationPlayer

var cur_menu

func _ready():
	_connect_pause_menu_signal()
	
	cur_menu = pause_menu
	
	pause_music.volume_db = linear_to_db(0)
	pause_music.play(randf() * pause_music.stream.get_length() / 2)

func _process(delta):
	if !TransitionSystem.anim_player.is_playing():
		if db_to_linear(pause_music.volume_db) < 0.5:
			pause_music.volume_db = linear_to_db(db_to_linear(pause_music.volume_db) + 0.01 * delta)

func _input(event):
	cur_menu.on_input(event)

func _on_option_selected(_option_idx, option):
	match option:
		"Resume":
			_unpause()
		"Restart Song":
			_exit_level_premature("_restart")
		"Options":
			var options_ui = OPTIONS_UI.instantiate()
			
			cur_menu = options_ui
			add_child(options_ui)
			
			pause_music.stop()
			options_notice_anim.play("Alpha_In")
			
		"Quit":
			_exit_level_premature("_quit_to_menu")

func _connect_pause_menu_signal():
	var menu
	
	if pause_menu:
		menu = pause_menu
	else:
		menu = get_node(pause_menu_path)
	
	menu.connect("option_selected", Callable(self, "_on_option_selected").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)

func _unpause():
	get_parent().set_pause(false)

func _exit_level_premature(func_name):
	music_tween.interpolate_property(pause_music, "volume_db", pause_music.volume_db, linear_to_db(0.005), 0.7)
	
	TransitionSystem.play_transition(TransitionSystem.Transitions.BASIC_FADE_OUT)
	TransitionSystem.connect("transition_finished", Callable(self, "_stop_music").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
	TransitionSystem.connect("transition_finished", Callable(self, func_name).bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)

func _restart(_trans_name):
	get_parent().restart()

func _quit_to_menu(_trans_name):
	get_parent().quit_to_menu()

func _stop_music(_trans_name):
	pause_music.stop()

func handle_options_exit():
	cur_menu.anim_player.connect("animation_finished", Callable(self, "_return_control_to_pause_menu").bind(), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
	options_notice_anim.play("Alpha_Out")

func _return_control_to_pause_menu(_anim_name):
	_ready()
