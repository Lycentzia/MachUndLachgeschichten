extends Area2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2
	position.y -= 800


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
