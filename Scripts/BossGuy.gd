extends CharacterBody2D
class_name BossGuy

#import bullet scene
var bullet = preload("res://Scenes/BossGuyBullet.tscn")
@onready var player = get_tree().get_first_node_in_group("Player")
var move_speed:float = 180
var tp_rate:float = 15
var tp_time:float
@onready var cooldown = $Cooldown

var kill_candles:Array[Node]

@export var  death_sound:AudioStream

const speed = 300.0


func _ready() -> void:
	
	
	kill_candles = get_tree().get_nodes_in_group("KillerCandle")

func _physics_process(delta: float) -> void:
	
	check_for_death()
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
	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			$Right.visible = true
			$Left.visible = false
		else:
			$Right.visible = false
			$Left.visible = true
		$Back.visible = false
		$Front.visible = false
	else:
		$Right.visible = false
		$Left.visible = false
		if velocity.y > 0:
			$Back.visible = false
			$Front.visible = true
		else:
			$Front.visible = false
			$Back.visible = true
func check_for_death():
	
	for kill_candle in kill_candles:
		
		if kill_candle.is_lit != true:
			
			return
	
	var deathsound = AudioStreamPlayer.new()
	get_tree().current_scene.add_child(deathsound)
	deathsound.volume_db = 10
	deathsound.stream = death_sound
	deathsound.play()
	queue_free()
	
func _on_shoot_timer_timeout() -> void:
	spawn_bullet()

func spawn_bullet() -> void:
	var bullet = bullet.instantiate() as Node2D
	bullet.global_position = global_position + (-global_position.direction_to(bullet.global_position))
	get_tree().current_scene.add_child(bullet)
func _on_cooldown_timeout() -> void:
	spawn_bullet()
	pass # Replace with function body.
