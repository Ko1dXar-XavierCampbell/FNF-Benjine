extends Resource
class_name LevelInfo, "res://scripts/resources/level_info/level_info_icon.svg"

@export var chart: Resource = null
@export var level: PackedScene = null

@export var instrumental_override: AudioStream = null
@export var vocals_override: AudioStream = null

@export var onetime_events: Resource = null
@export var repeating_events: Resource = null
@export var rand_repeat_events: Resource = null
@export var camera_pan_events: Resource = null

func _init(
	chart_: SongChart = null,
	level_: PackedScene = null,
	instrumental_override_: AudioStream = null,
	vocals_override_: AudioStream = null,
	onetime_events_: ResourceList = null,
	repeating_events_: ResourceList = null,
	rand_repeat_events_: ResourceList = null
):
	chart = chart_
	level = level_
	
	instrumental_override = instrumental_override_
	vocals_override = vocals_override_
	
	onetime_events = onetime_events_
	repeating_events = repeating_events_
	rand_repeat_events = rand_repeat_events_
