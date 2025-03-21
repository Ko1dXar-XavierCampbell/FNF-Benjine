extends EditorExportPlugin

func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int) -> void:
	var file = File.new()
	var directory = DirAccess.new()
	
	var paths = DialogicResources.get_working_directories()
	
	# Loops through every file in the working directories 
	# and adds it as a custom export file
	for dir in paths:
		if directory.open(paths[dir]) == OK:
			directory.list_dir_begin() # TODOConverter3To4 fill missing arguments https://github.com/godotengine/godot/pull/40547
			var file_name = directory.get_next()
			while file_name != "":
				if not directory.current_is_dir():
					var file_lower = file_name.to_lower()
					if '.json' in file_lower or '.cfg' in file_lower:
						var file_path = paths[dir] + "/" + file_name
						if file.open(file_path, File.READ) == OK:
							add_file(file_path, file.get_buffer(file.get_length()), false)
						file.close()
				file_name = directory.get_next()
