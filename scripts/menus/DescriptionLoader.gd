extends Node

const READY_TEXTURE = preload("res://assets/graphics/menus/mod_loader/mod_loader_screen_part_2.png")

@onready var bg = $BG
@onready var progress_label = $Label
@onready var transition_anim = $Polygon2D/AnimationPlayer

func _ready():
	if OS.has_feature("editor") || OS.get_name() == "HTML5":
		get_tree().change_scene_to_file("res://scenes/Main.tscn")
	else:
		call_deferred("_load_descriptions")

func _load_descriptions():
	VolumeChanger.disabled = true
	transition_anim.play("Fade_In")
	await transition_anim.animation_finished
	
	########################################
	
	var directory = DirAccess.new()

	# At this point, the mods folder exists or has been created
	directory.open(UserData.get_modpacks_path())
	directory.list_dir_begin() # TODOConverter3To4 fill missing arguments https://github.com/godotengine/godot/pull/40547

	var file_name = directory.get_next()
	var num_mod_descs = 0

	while file_name != "":
		if !directory.current_is_dir() && file_name.ends_with("desc.pck"):
			var mod_path = UserData.get_modpacks_path().plus_file(file_name)

			print("Attempting to load mod desc: " + file_name + " at " + mod_path)
			progress_label.text = "Loading " + file_name + "..."
			await get_tree().create_timer(0.5).timeout

			var success = ProjectSettings.load_resource_pack(mod_path)
			print("Loading of mod desc" + file_name + " at " + mod_path + " successful?: " + str(success))
			
			if success:
				num_mod_descs += 1

		file_name = directory.get_next()
	
	bg.texture = READY_TEXTURE
	progress_label.text = "Ready! Found " + str(num_mod_descs) + " mod description(s)."
	await get_tree().create_timer(1).timeout
	
	########################################
	
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
