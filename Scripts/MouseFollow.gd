extends Node2D
class_name MouseFollow



func _physics_process(delta: float) -> void:
	
	
	global_position = get_global_mouse_position()
