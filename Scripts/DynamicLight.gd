extends PointLight2D
class_name DynamicLight


@export var gradient:Gradient


var time:float
func _physics_process(delta: float) -> void:
	time += delta
	if time >= 1:
		time = 0
	
	color = gradient.sample(time)
	
