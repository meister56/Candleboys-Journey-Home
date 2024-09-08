extends CharacterBody2D
class_name BossGuy

#import bullet scene
var bullet = preload("res://Scenes/BossGuyBullet.tscn")
@onready var player = get_tree().get_first_node_in_group("Player")
var move_speed:float = 150
var tp_rate:float = 15
var tp_time:float
@onready var cooldown = $Cooldown

const speed = 300.0
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
	
		
func _on_shoot_timer_timeout() -> void:
	spawn_bullet()

func spawn_bullet() -> void:
	var bullet = bullet.instantiate() as Node2D
	bullet.global_position = global_position + (-global_position.direction_to(bullet.global_position))
	get_tree().current_scene.add_child(bullet)
	$BossGuy.play()
func _on_cooldown_timeout() -> void:
	spawn_bullet()
	pass # Replace with function body.
