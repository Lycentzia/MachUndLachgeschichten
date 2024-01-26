extends RigidBody2D
var screen_size # Size of the game window.
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = randf() * screen_size
	
	player = get_node("../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_pressed("action"):
		position = player.global_position
		z_index = 100
	else:
		z_index = 0
