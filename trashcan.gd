extends Area2D
var trash_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.animation = "sad"
	set_position(Vector2(randf(), randf()) * (get_viewport_rect().size - Vector2(20,20)) + Vector2(10,10))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	for item in get_overlapping_bodies():
		if !Input.is_action_pressed("action"):
			item.queue_free()
			trash_score += 1
