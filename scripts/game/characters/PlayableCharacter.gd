extends "res://scripts/game/characters/Character.gd"

@export var miss_anims: Array = ["Left_Miss", "Down_Miss", "Up_Miss", "Right_Miss"]
@export var death_scene_path = "res://scenes/shared/game/game_over/GameOver.tscn" # (String, FILE, "*.tscn")
@export var death_scene_requirements: Script = preload("res://scripts/game/game_over/GameOverRequirements.gd")

@onready var death_scene = load(death_scene_path)

func get_requirements(lvl):
	return death_scene_requirements.new().get_requirements(lvl)
