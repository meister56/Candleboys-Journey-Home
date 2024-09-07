extends StaticBody2D
class_name Door
signal just_opened


@export var candles_lit_required:Array[Candle]

@onready var animator:AnimatedSprite2D = $AnimatedSprite2D

@onready var collision_shape:CollisionShape2D = $CollisionShape2D 

var opened:bool = false

func _physics_process(delta: float) -> void:
	
	check_all_candles_lit()

func check_all_candles_lit():
	for candle in candles_lit_required:
		if not candle.is_lit:
			return  # Exit the function if any candle is not lit
	
	open()  # If all candles are lit, open the object

func open():
	if opened == false:
		just_opened.emit()
		collision_shape.disabled = true
		animator.play("open")
		opened = true
	
