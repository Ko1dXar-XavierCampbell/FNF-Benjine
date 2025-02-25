extends "res://scripts/game/characters/BeatNode.gd"

@export var first_idle: String = "Dance_Left"
@export var second_idle: String = "Dance_Right"

@export var starts_on_left: bool = true

var danced_right = true

func on_ready():
	danced_right = starts_on_left
	super.on_ready()

func idle():
	if danced_right:
		play_anim(first_idle)
	else:
		play_anim(second_idle)
	
	danced_right = !danced_right
