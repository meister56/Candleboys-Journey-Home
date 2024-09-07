extends Camera2D
class_name CameraController


@export var distance:float

@export var target:Node2D




func _physics_process(delta: float) -> void:
	
	if global_position.distance_to(target.global_position) > distance:
		
		global_position = lerp(global_position,target.global_position,delta)
	
