class_name Player
extends KinematicBody

export var max_speed = 700
export var gravity = 70
export var jump_impulse = 25

var velocity = Vector3.ZERO

var touch_x = 0
var touch_y = 0

onready var pivot = $Pivot

func _physics_process(delta):
	var input_vector = get_input_vector()
	#print(input_vector)
	apply_movement(input_vector)
	apply_gravity(delta)
	jump()
	velocity = move_and_slide(velocity, Vector3.UP)
	
	
func get_input_vector():
	var input_vector = Vector3.ZERO
	#input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#input_vector.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	input_vector.x = touch_x
	input_vector.z = touch_y
	
	#print("input_vector.x ", input_vector.x)
	#print("input_vector.y ", input_vector.y)
	
	return input_vector.normalized()
	

func apply_movement(input_vector):
	velocity.x = input_vector.x * max_speed
	velocity.z = input_vector.z * max_speed
	
	if input_vector != Vector3.ZERO:
		pivot.look_at(translation + input_vector, Vector3.UP)
	
	
func apply_gravity(delta):
	velocity.y -= gravity * delta
	

func jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = jump_impulse


func _on_VirtualJoystick_analogic_chage(move):
	touch_x = move[0]
	touch_y = move[1]




func _on_vgui_interact_button1_pressed():
	jump()
	var ev = InputEventAction.new()
	ev.action = "ui_left"
	ev.pressed = true
	Input.parse_input_event(ev)
	print("_on_vgui_interact_button1_pressed(): has fired")


func _on_vgui_interact_button2_button_down():
	var ev = InputEventAction.new()
	ev.action = "jump"
	ev.pressed = true
	Input.parse_input_event(ev)


func _on_vgui_interact_button2_button_up():
	var ev = InputEventAction.new()
	ev.action = "jump"
	ev.pressed = false
	Input.parse_input_event(ev)
