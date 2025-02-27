extends Resource
class_name GameEventInfo

@export var occurrence_time: float = 0
@export var time_units := Conductor.Notes.SECONDS # (Conductor.Notes)
@export var check_floored_time := false

@export var func_ref_nodepath := "."
@export var func_ref_property_path := ""
@export var func_ref_func_name := ""

@export var func_ref_args := []

func _init(occurrence_time_: float = 0,
		time_units_ = -1,
		check_floored_time_: bool = false,
		func_ref_nodepath_ : String = ".",
		func_ref_property_path_ : String = "",
		func_ref_func_name_ : String = "",
		func_ref_args_ : Array = []):
	
	occurrence_time = occurrence_time_
	time_units = time_units_
	check_floored_time = check_floored_time_
	func_ref_nodepath = func_ref_nodepath_
	func_ref_property_path = func_ref_property_path_
	func_ref_func_name = func_ref_func_name_
	func_ref_args = func_ref_args_
