extends AudioStreamPlayer2D
class_name SoundWhenVisible



func _physics_process(_delta: float) -> void:
	
	if get_parent().visible == false:
		
		volume_db = -100
		
	else:
		volume_db = 0
