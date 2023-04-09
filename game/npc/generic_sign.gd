extends Area

export(NodePath) var node_path
export(String) var enter_method
export(String) var exit_method

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_body_entered(body):
	if body is Player:
		if node_path:
			if get_node_or_null(node_path) != null:
				if get_node(node_path).has_method(enter_method):
					get_node(node_path).call(enter_method)
				else:
					printerr("Trigger node missing method")
			else:
				printerr("Trigger couldn't get node")
		else:
			printerr("Trigger node path empty")


func _on_body_exited(body):
	if body is Player:
		if node_path:
			if get_node_or_null(node_path) != null:
				if get_node(node_path).has_method(exit_method):
					get_node(node_path).call(exit_method)
				else:
					printerr("Trigger node missing method")
			else:
				printerr("Trigger couldn't get node")
		else:
			printerr("Trigger node path empty")

