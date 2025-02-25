extends "res://scripts/menus/options/OptionsSubmenu.gd"

func on_scroll():
	super.on_scroll()
	
	for option in options:
		option.unprime()

func on_back():
	super.on_back()
	
	for option in options:
		option.unprime()

func on_select(_event):
	super.on_select(_event)
	
	options[cur_option].on_input(_event)
