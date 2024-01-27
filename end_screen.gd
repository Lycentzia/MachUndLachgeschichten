extends Node2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.target = $Player
	$Camera2D.target_zoom = Vector2(0.2, 0.2)
	
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D_boss.position = screen_size / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
