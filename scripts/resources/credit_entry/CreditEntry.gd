extends Resource
class_name CreditEntry

const DEFAULT_ICON = preload("res://assets/graphics/menus/credits/unknown_credit.tres")

@export var icons = [DEFAULT_ICON] # (Array, Texture2D)
@export var name: String
@export var roles_or_contributions # (String, MULTILINE)
@export var links # (Array, String)
@export var link_names # (Array, String)
@export var link_colors # (Array, Color)

func _init(
	icons_: Array = [DEFAULT_ICON],
	name_: String = "",
	roles_or_contributions_: String = "",
	links_: Array = [],
	link_names_: Array = [],
	link_colors_: Array = []
):
	icons = icons_
	name = name_
	roles_or_contributions = roles_or_contributions_
	links = links_
	link_names = link_names_
	link_colors = link_colors_
