extends CharacterBody2D
class_name Player
var flame_color: Color   
@export var is_lit: bool = true


const speed = 300.0
var is_interacting: bool = false

var current_state: State = State.IDLE # Default to IDLE STATE
@export var interact_range:float = 50
@export var interaction_delay:float = 1.5
#FOOTSTEP LOGIC
@export var footstep_rate:float = 0.4
@onready var footstep_player:AudioStreamPlayer2D = $FootSteps
var footstep_time:float 

var input_direction

enum State {
	IDLE,
	WALK,
	INTERACT,
	DEAD
}

var interaction_time:float

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = (input_direction * speed)
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("interact"):
		current_state = State.INTERACT
		for candle in get_tree().get_nodes_in_group("Candle"):
			
			if candle.global_position.distance_to(global_position) <= interact_range:
				candle.light_candle()
			
	elif input_direction != Vector2.ZERO:
		current_state = State.WALK
		play_footstep_sounds()
	else:
		current_state = State.IDLE
		# Check if the 'E' key is pressed and a candle is nearby

	get_input()
	
	move_and_slide()
	
	match current_state:
		
		State.INTERACT:
			pass
			
		State.IDLE:
			pass
		State.DEAD:
			pass



func play_footstep_sounds():
	if current_state == State.WALK:
		footstep_time += get_physics_process_delta_time()
		if footstep_time >= footstep_rate:
			footstep_time = 0
			footstep_player.play()


func _on_death_zone_body_entered(body: Node2D) -> void:
	
	current_state = State.DEAD
	print("Entered") # Put death stuff here dont ask why
	get_tree().reload_current_scene()  # Reload Scene if Entered
	
