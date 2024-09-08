extends CharacterBody2D
class_name Monster


var move_speed:float = 80

@onready var player = get_tree().get_first_node_in_group("Player")


func _physics_process(delta: float) -> void:
	var direction:Vector2 = global_position.direction_to(player.global_position)
	if player != null:
		if player.is_lit || global_position.distance_to(player.global_position) < 500:
			velocity = direction * move_speed
		
	move_and_slide()
	
func _on_bad_guy_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "CandleBoy":
		$Laughs.play()
		player.die()
