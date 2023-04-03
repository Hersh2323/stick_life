extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $MarginContainer/VBoxContainer/menu_options.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])
	

func _on_button_pressed(scene_to_load):
	# docstring
	# input:	string called from ui element
	# return:	this returns no value. variable defined is used to avoid the error of calling get_tree() function with unused return result
	# description:	this method is called by a ui element to change the scene to the "overworld" open-world game enviroment
	var _unused_scene_variable = get_tree().change_scene(scene_to_load)
	
