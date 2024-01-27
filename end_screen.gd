extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.target = $Player
	$Camera2D.target_zoom = Vector2(0.2, 0.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
