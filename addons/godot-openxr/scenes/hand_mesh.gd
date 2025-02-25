@tool
extends Node3D

enum MOTION_RANGE {
	UNUBSTRUCTED = 0,
	CONFORM_TO_CONTROLLER = 1
}

@export var motion_range: MOTION_RANGE: set = set_motion_range
@export var albedo_texture: Texture2D: set = set_albedo_texture
@export var normal_texture: Texture2D: set = set_normal_texture
@export var skeleton: NodePath = NodePath("HandModel/Armature001/Skeleton3D")
@export var hand_mesh: NodePath = NodePath("HandModel/Armature001/Skeleton3D/vr_glove_left_slim")

var material : StandardMaterial3D

func set_motion_range(value):
	motion_range = value
	if is_inside_tree():
		_update_motion_range()

func _update_motion_range():
	get_node(skeleton).motion_range = motion_range

func set_albedo_texture(value):
	albedo_texture = value
	if is_inside_tree():
		_update_albedo_texture()

func _update_albedo_texture():
	if material:
		material.albedo_texture = albedo_texture

func set_normal_texture(value):
	normal_texture = value
	if is_inside_tree():
		_update_normal_texture()

func _update_normal_texture():
	if material:
		material.normal_texture = normal_texture

# Called when the node enters the scene tree for the first time.
func _ready():
	material = get_node(hand_mesh).mesh.surface_get_material(0)

	_update_motion_range()
	_update_albedo_texture()
	_update_normal_texture()
