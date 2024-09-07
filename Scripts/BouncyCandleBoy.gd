extends RigidBody2D
class_name BouncyCandleBoy



var move_speed:float = 10

func _ready() -> void:
	
	add_constant_force(Vector2.RIGHT * oscillate(get_physics_process_delta_time()) * move_speed)
func _physics_process(delta: float) -> void:
	rotation = 0
	linear_velocity.x =  oscillate(delta * 5) * move_speed
	
	
	pass


func oscillate(delta: float) -> float:
	return sin(Time.get_ticks_msec() * delta)
