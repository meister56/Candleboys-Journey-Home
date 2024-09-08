extends AudioStreamPlayer2D
class_name PlaySoundInRange


@export var distance:float = 1000



var once:bool = false

func _physics_process(_delta: float) -> void:
	
	
	if get_tree().get_first_node_in_group("Player") != null && once == false:
		
		if get_tree().get_first_node_in_group("Player").global_position.distance_to(global_position) < distance:
			once = true
			play()
