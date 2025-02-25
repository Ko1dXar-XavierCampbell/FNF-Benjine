extends Node

@export var offset_text_path: String = "res://"
@export var offset_file_path: String = "res://"

func _ready():
	await get_tree().idle_frame
	var offset_text = File.new()
	
	offset_text.open(offset_text_path, File.READ)
	
	while (!offset_text.eof_reached()):
		var string = offset_text.get_line().split(" ")
		
