extends Resource
class_name SongData

const DEFAULT_DIFFICULTY_NAMES = [
	"Easy",
	"Normal",
	"Hard"
]

@export var name: String = ""
@export var level_info_paths = [] # (Array, String, FILE, "*.lvl_info.res,*.lvl_info.tres")
@export var difficulty_names = DEFAULT_DIFFICULTY_NAMES # (Array, String)
@export var icons: SpriteFrames = null
@export var icon_index: int = 0
@export var freeplay_bg_color: Color = Color("#9271fd")
@export var freeplay_outline_color: Color = Color("#2846dc")
@export var inst_preview_path = "" # (String, FILE, "*.mp3,*.ogg")

func _init(name_ = "",
		   level_info_paths_ = [],
		   difficulty_names_ = DEFAULT_DIFFICULTY_NAMES,
		   icons_ = null,
		   icon_idx = 0,
		   inst_preview_path_ = ""):
	name = name_
	level_info_paths = level_info_paths_
	difficulty_names = difficulty_names_
	icons = icons_
	icon_index = icon_idx
	inst_preview_path = inst_preview_path_
