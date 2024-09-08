extends CharacterBody2D
class_name Player
  
@export var is_lit: bool = true


const speed = 300.0
var is_interacting: bool = false

var color_type = "RED"
var current_state: State = State.IDLE # Default to IDLE STATE
@export var interact_range:float = 100
@export var interaction_delay:float = 1.5
#FOOTSTEP LOGIC
@export var footstep_rate:float = 0.4
@onready var footstep_player:AudioStreamPlayer2D = $FootSteps
var footstep_time:float 
@onready var put_out_sound:AudioStreamPlayer2D = $PutOut
var input_direction

enum State {
	IDLE,
	WALK,
	INTERACT,
	FALL,
	DEAD
}


var interaction_time:float

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = (input_direction * speed)
	

func _physics_process(delta: float) -> void:
	get_input()
	var is_alive:bool = current_state != State.FALL 
	
	if Input.is_action_just_pressed("put_out"):
		light_toggle(false)
	if Input.is_action_just_pressed("interact") && is_alive:
		current_state = State.INTERACT
		for candle in get_tree().get_nodes_in_group("Candle"):
			
			if candle.global_position.distance_to(global_position) <= interact_range:
				
				if candle.is_lit:
					color_type = candle.color_type
					light_toggle(true)
				elif is_lit == true && candle.color_type == color_type:
					candle.light_candle()
				
	elif input_direction != Vector2.ZERO && is_alive:
		move_and_slide()
		current_state = State.WALK
		play_footstep_sounds()
	elif is_alive:
		current_state = State.IDLE
		# Check if the 'E' key is pressed and a candle is nearby


func light_toggle(value:bool):
	is_lit = value
	if value == false:
		put_out_sound.play()


func play_footstep_sounds():
	if current_state == State.WALK:
		footstep_time += get_physics_process_delta_time()
		if footstep_time >= footstep_rate:
			footstep_time = 0
			footstep_player.play()


func _on_death_zone_body_entered(body: Node2D) -> void:
	if body.name  == self.name:
		die()
	

func die():
		current_state = State.FALL
		await get_tree().create_timer(4).timeout
		get_tree().reload_current_scene()  # Reload Scene if Entered
		pass # Replace with function body.
