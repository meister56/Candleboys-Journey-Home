extends Node2D
@export var speed: float = 450.0
var velocity: Vector2

# Reference to the player
@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	# Calculate direction towards the player
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed

func _process(delta):
	# Move the bullet towards the player
	position += velocity * delta


func _on_body_entered(body):
	if body.is_in_group("Player"):  # Assuming the player is in the "Player" group
		body.die()
		queue_free()  # Remove the bullet on collision
