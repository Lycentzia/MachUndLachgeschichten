extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(Vector2(randf(), randf()) * get_viewport_rect().size - Vector2(50,50))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
