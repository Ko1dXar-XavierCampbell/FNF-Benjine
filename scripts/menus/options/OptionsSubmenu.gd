extends Control

const LERP_VAL = 0.3

@export var scroll_sound_path: NodePath = NodePath("../../Scroll_SFX")
@export var confirm_sound_path: NodePath = NodePath("../../Confirm_SFX")
@export var back_sound_path: NodePath = NodePath("../../Cancel_SFX")
@export var valid_options_paths # (Array, NodePath)
@export var y_start: float = 120
@export var submenu_desc: String = "WIP"

@onready var options_ui = get_parent().get_parent()

@onready var scroll_sound = get_node(scroll_sound_path)
@onready var confirm_sound = get_node(confirm_sound_path)
@onready var back_sound = get_node(back_sound_path)

var options = []
var cur_option = 0

func _ready():
	for path in valid_options_paths:
		options.append(get_node(path))

func _process(_delta):
	if len(options) > 0:
		position.y = lerp(position.y, y_start - options[cur_option].position.y, GodotX.get_haxeflixel_lerp(LERP_VAL))

func on_input(event: InputEvent):
	if GodotX.xor(event.is_action_released("ui_up"), event.is_action_released("ui_down")):
		var increment = -1 if event.is_action_released("ui_up") else 1
	
		cur_option = wrapi(cur_option + increment, 0, len(options))
		on_scroll()
	
	elif event.is_action_released("ui_accept"):
		on_select(event)
	
	elif event.is_action_released("ui_cancel"):
		on_back()

func on_scroll():
	set_option_alphas()
	
	scroll_sound.stop()
	scroll_sound.play()

func on_select(_event):
	confirm_sound.stop()
	confirm_sound.play()

func on_back():
	options_ui.change_menu(0)
	
	back_sound.stop()
	back_sound.play()

func reset():
	cur_option = 0
	set_option_alphas()

func set_option_alphas():
	for option_idx in len(options):
		if option_idx == cur_option:
			options[option_idx].modulate.a = 1.0
		else:
			options[option_idx].modulate.a = 0.5
