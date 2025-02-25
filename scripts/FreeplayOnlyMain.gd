extends "res://scripts/general/StateManager.gd"

const FREEPLAY_MENU = preload("res://scenes/shared/menus/default_menus/FreeplayMenu.tscn")

@export var alt_freeplay: PackedScene = null
@export var quit: bool = true
@export var package_name: String
@export var prev_menu_path  # (String, DIR)
@export var immediate_load: bool = true

func _ready():
	randomize()
	if alt_freeplay:
		switch_state(alt_freeplay, {
			"freeplay_list": UserData.get_freeplay_list(package_name),
			"prev_menu_path": "QUIT" if quit else prev_menu_path
		})
	else:
		switch_state(FREEPLAY_MENU, {
			"freeplay_list": UserData.get_freeplay_list(package_name),
			"prev_menu_path": "QUIT" if quit else prev_menu_path
		})
