extends GameEventInfo
class_name RandRepeatGameEventInfo

@export var time_increment: Array = [1, 2]
@export var generate_with_ints: bool = false
@export var inclusive_int_range: bool = true

func _init(occurrence_time_: float = 0,
		time_units_ = -1,
		check_floored_time_: bool = false,
		func_ref_nodepath_ : String = ".",
		func_ref_property_path_ : String = "",
		func_ref_func_name_ : String = "",
		func_ref_args_ : Array = [],
		time_increment_ : Array = [1, 2],
		generate_with_ints_ : bool = false,
		inclusive_int_range_ : bool = true):
	super._init(
		occurrence_time_,
		time_units_,
		check_floored_time_,
		func_ref_nodepath_,
		func_ref_property_path_,
		func_ref_func_name_,
		func_ref_args_
	)
	time_increment = time_increment_
	generate_with_ints = generate_with_ints_
	inclusive_int_range = inclusive_int_range_
