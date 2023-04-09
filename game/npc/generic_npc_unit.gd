extends KinematicBody



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func dialog_visibilty_on():
	#self.visible = true
	
	var label_child = self.get_node("Label3D")
	label_child.visible = true
	pass

func dialog_visibility_off():
	var label_child = self.get_node("Label3D")
	label_child.visible = false
	pass
