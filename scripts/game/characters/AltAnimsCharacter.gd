extends "res://scripts/game/characters/Character.gd"

@export var suffixes # (Array, String)
@export var current_suffix: int

func play_anim(anim_data, anim_length = 0, forced = true, uninterruptable = false):
	var anim_name = get_anim_name(anim_data)
	
	if anim_player.has_animation(anim_name + suffixes[current_suffix]):
		anim_name += suffixes[current_suffix]
	
	super.play_anim(anim_name, anim_length, forced, uninterruptable)
