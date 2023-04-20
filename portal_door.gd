class_name portal
extends Area


export var portal_destination_path = "res://game/structures/portal_default_room.tscn"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body is Player:
		

		var _discard = get_tree().change_scene(portal_destination_path)
