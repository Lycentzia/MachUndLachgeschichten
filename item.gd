extends RigidBody2D
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = randf() * screen_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
