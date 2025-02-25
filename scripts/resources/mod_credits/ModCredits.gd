extends Resource
class_name ModCredits

@export var mod_icon: Texture2D
@export var mod_name: String
@export var credits # (Array, Resource)

func _init(
	mod_icon_: Texture2D = null,
	mod_name_: String = "",
	credits_: Array = []
):
	mod_icon = mod_icon_
	mod_name = mod_name_
	credits = credits_
