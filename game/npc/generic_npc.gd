extends Area

export(NodePath) var node_path
export(String) var enter_method
export(String) var exit_method
export var scene_string = 'timeline-test_1'

var alert_active = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("ui_left") and alert_active:
			get_tree().paused = true
			var dialog = Dialogic.start(scene_string)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)
	else:
		printerr("DialogNode not null")

func unpause(_timeline_name):
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$overhead_arrow.visible = alert_active

func _on_body_entered(body):
	if body is Player:
		alert_active = true


func _on_body_exited(body):
	if body is Player:
		alert_active = false
