extends Camera


# Declare member variables here. Examples:
export var distance = 2.5
export var height = 1.5



# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_as_toplevel(true)

func _physics_process(_delta):
	var target = get_parent().get_global_transform_interpolated().origin
	var pos = get_global_transform_interpolated().origin
	var up = Vector3(0,1,0)
	
	var offset = pos - target
	
	offset = offset.normalized()*distance
	offset.y = height
	
	pos = target + offset
	
	look_at_from_position(pos, target, up)
