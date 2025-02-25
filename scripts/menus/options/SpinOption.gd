extends Label

const DEFAULT_OPTIONS = ["Off", "On"]

const SPIN_TIME_INIT = 0.4
const SPIN_TIME_HELD = 0.05

@export var option_name: String
@export var option_category: String = "options"
@export var option_package: String = "general"

@export var options = DEFAULT_OPTIONS # (Array, String)

@export var num_range: bool = false
@export var num_range_min: int = 0
@export var num_range_max: int = 0

@export var default_option: int = 0

@onready var option_string = $Option_String
@onready var spin_timer = $Spin_Timer

var option_idx = 0

func _ready():
	if text.is_empty():
		text = option_name.capitalize()
	option_idx = default_option
	_format_cur_option(option_idx)

func reload():
	option_idx = UserData.get_setting(option_name, default_option, option_category, option_package)
	_format_cur_option(option_idx)

func on_input(event: InputEvent):
	if GodotX.xor(event.is_action("ui_left"), event.is_action("ui_right")):
		if event.is_pressed():
			var increment = -1 if event.is_action("ui_left") else 1
			
			# Stop the timer if it's running
			if spin_timer.is_connected("timeout", Callable(self, "_spin_option")):
				spin_timer.disconnect("timeout", Callable(self, "_spin_option"))
			spin_timer.stop()
			
			_spin_option(increment, true)
			
		else:
			if spin_timer.is_connected("timeout", Callable(self, "_spin_option")):
				spin_timer.disconnect("timeout", Callable(self, "_spin_option"))
			spin_timer.stop()

func _spin_option(increment, initial_press = false):
	_spin_option_idx(increment)
	
	# Save the data
	UserData.set_setting(option_name, option_idx, option_category, option_package)
	
	# Display the current option
	_format_cur_option(option_idx)
	
	# Start the next timer if necessary
	if (increment == -1 && Input.is_action_pressed("ui_left")) || \
	   (increment ==  1 && Input.is_action_pressed("ui_right")):
		spin_timer.connect("timeout", Callable(self, "_spin_option").bind(increment), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
		spin_timer.start(SPIN_TIME_INIT if initial_press else SPIN_TIME_HELD)

func _spin_option_idx(increment):
	if num_range:
		option_idx = wrapi(option_idx + increment, num_range_min, num_range_max + 1)
	else:
		option_idx = wrapi(option_idx + increment, 0, options.size())

func _format_cur_option(idx):
	if num_range:
		option_string.text = "< " + str(idx) + " >"
	else:
		option_string.text = "< " + options[idx].capitalize() + " >"
