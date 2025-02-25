extends Resource
class_name ModDescription

# Required info for mods
@export var mod_name: String = "My FNF Mod"
@export var mod_author: String = "Me"
@export var mod_version: String = "1.0.0"
@export var mod_package_name: String = ""
@export var advanced_mod: bool = false
# Required info for advanced mods only
@export var banner: Texture2D = null
@export var main_path = "res://scenes/Main.tscn" # (String, FILE)
@export var description = "" # (String, MULTILINE)

func _init(mod_name_ = "My FNF Mod",
		   mod_author_ = "Me",
		   mod_version_ = "1.0.0",
		   advanced_mod_ = false,
		   banner_ = null,
		   mod_package_name_ = "",
		   main_path_ = "",
		   description_ = ""):
	mod_name = mod_name_
	mod_author = mod_author_
	mod_version = mod_version_
	advanced_mod = advanced_mod_
	banner = banner_
	mod_package_name = mod_package_name_
	main_path = main_path_
	description = description_
