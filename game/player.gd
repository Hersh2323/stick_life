class_name Player
extends KinematicBody

var gravity = -9.8
var velocity = Vector3()
var camera
var character


const SPEED = 2
const ACCELERATION = 6
const DE_ACCELERATION = 5

func _ready():
# Called every time the node is added to the scene.
# Initialization here
# pass
	camera = get_node("target/Camera").get_global_transform()
	#player = get_node(".")


#func _process(delta):
# # Called every frame. Delta is time since last frame.
# # Update game logic here.
# pass



func _physics_process(delta):
	camera = get_node("target/Camera").get_global_transform()
	var dir = Vector3()

	var is_moving = false

	if(Input.is_action_pressed("ui_up")):
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("ui_down")):
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("ui_left")):
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("ui_right")):
		dir += camera.basis[0]
		is_moving = true

	dir.y = 0
	dir = dir.normalized()

	velocity.y += delta * gravity

	var hv = velocity
	hv.y = 0

	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION

	if (dir.dot(hv) > 0):
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(new_pos, accel * delta)

	velocity.x = hv.x
	velocity.z = hv.z
		
	velocity = move_and_slide(velocity, Vector3(0,1,0))

	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var char_rot = self.get_rotation()
		
		char_rot.y = angle
		self.set_rotation(char_rot)
		
		
