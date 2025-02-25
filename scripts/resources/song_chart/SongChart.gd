extends Resource
class_name SongChart, "res://scripts/resources/song_chart/song_chart_icon.svg"

enum ChartType {SNIFF, FNFVR, KADE_V6PLUS, PSYCH}

@export var instrumental: AudioStream = null
@export var vocals: AudioStream = null

@export var initial_bpm: float = 100
@export var bpm_maps = [] # (Array, Resource)

@export var scroll_speed: float = 1

@export var lanes: Dictionary = {
	player = [],
	opponent = []
}
