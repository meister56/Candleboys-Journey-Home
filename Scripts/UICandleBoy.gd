extends Sprite2D
class_name UICandleBoy


@export var poses:Array[Texture2D]


var max_position_distance:float = 450

var pose_change_frequency = 3

var bob_height:float 

var pose_time:float

var move_direction:Vector2

func _physics_process(delta: float) -> void:
	pose_time += delta
	
	if pose_time >= pose_change_frequency:
		
		modulate.a -= 0.025
		
		if modulate.a < 0:
			change_pose()
	global_position.y += oscillate(delta)
	global_position += move_direction
	
func oscillate(delta: float) -> float:
	return sin(Time.get_ticks_msec() * delta)

func change_pose():
		modulate.a = 1
		pose_time = 0
		global_position = get_global_mouse_position() + Vector2(randf_range(-max_position_distance,max_position_distance),randf_range(-max_position_distance,max_position_distance))
		move_direction = Vector2(randf_range(-1,1),randf_range(-1,1))
		pose_time = 0
		texture = poses.pick_random()
