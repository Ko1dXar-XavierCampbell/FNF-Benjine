@tool
extends Node2D

@export var sustain_line: StyleBoxTexture: set = set_sus_line
@export var percent_length: float = 1: set = set_percent
@export var total_length: float: set = set_total_length

func set_sus_line(val):
	sustain_line = val
	update()

func set_percent(val):
	percent_length = val
	update()

func set_total_length(val):
	total_length = val
	update()

func _draw():
	if !sustain_line:
		return
	
	var pos = Vector2(-sustain_line.region_rect.size.x / 2.0, 0)
	var size = Vector2(sustain_line.region_rect.size.x, total_length * percent_length)
	
	draw_style_box(sustain_line, Rect2(pos, size))
