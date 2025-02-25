extends Resource
class_name OptionEntry

const DEFAULT_OPTIONS = ["Off", "On"]

@export var option_name: String = ""
@export var option_display_name: String = ""

@export var options = DEFAULT_OPTIONS # (Array, String)

@export var num_range: bool = false
@export var num_range_min: int = 0
@export var num_range_max: int = 0

@export var default_option: int = 0

func _init(
	option_name_: String = "",
	option_display_name_: String = "",
	options_: Array = DEFAULT_OPTIONS,
	num_range_: bool = false,
	num_range_min_: int = 0,
	num_range_max_: int = 0,
	default_option_: int = 0
):
	option_name_ = option_name_
	option_display_name = option_display_name_
	options = options_
	num_range = num_range_
	num_range_min = num_range_min_
	num_range_max = num_range_max_
	default_option = default_option_
