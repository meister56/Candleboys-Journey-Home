extends AudioStreamPlayer2D
class_name SoundWhenVisible



func _physics_process(delta: float) -> void:
	
	if visible == false:
		
		volume_db = -100
		
	else:
		volume_db = 0
