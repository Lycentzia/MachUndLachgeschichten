# https://kidscancode.org/godot_recipes/3.x/2d/screen_shake/index.html
extends Camera2D

var decay = 0.8  # How quickly the shaking stops [0, 1].
var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
var target  # Assign the node this camera will follow.

var trauma = 0.0  # Current shake strength.
var trauma_power = 2  # Trauma exponent. Use [2, 3].

var target_zoom = Vector2(1,1)

func _ready():
	randomize()

func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)
	
func _process(delta):
	if target:
		global_position = target.global_position
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()
	if target_zoom > zoom:
		zoom = zoom * 1.01
	if target_zoom < zoom:
		zoom = zoom * 0.99
		
func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * randf_range(-1, 1)
	offset.x = max_offset.x * amount * randf_range(-1, 1)
	offset.y = max_offset.y * amount * randf_range(-1, 1)
