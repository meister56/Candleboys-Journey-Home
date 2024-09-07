extends Label
class_name Scroll


@export var speed:float = 0.1




func _physics_process(delta: float) -> void:
	
	
	
	
	position.y -= speed * delta
