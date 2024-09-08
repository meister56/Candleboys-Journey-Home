extends CharacterBody2D
class_name Monster


var move_speed:float = 150

@onready var player = get_tree().get_first_node_in_group("Player")
var tp_rate:float = 15
var tp_time:float

func _ready() -> void:
	
	randomize()
func _physics_process(delta: float) -> void:
	
	if player != null:
		var direction:Vector2 = global_position.direction_to(player.global_position)
		if player.is_lit || global_position.distance_to(player.global_position) < 500:
			velocity = direction * move_speed
		else:
			
			velocity = lerp(velocity,Vector2.ZERO,delta)
			tp_time += delta
			if tp_time > tp_rate:
				
				global_position = (player.global_position + (direction * 1000).rotated(randf_range(0,1)))
				tp_time = 0
	move_and_slide()
	
func _on_bad_guy_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "CandleBoy":
		$Laughs.play()
		player.die()
