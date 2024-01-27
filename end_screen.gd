extends Node2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.target = $Player
	$Camera2D.target_zoom = Vector2(0.1, 0.1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
