extends Area2D
var trash_score = 0
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.animation = "sad"
	set_position(Vector2(randf(), randf()) * (get_viewport_rect().size - Vector2(20,20)) + Vector2(10,10))

	player = get_node("../Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("action"):
		if player.position.x >= position.x && player.position.y >= position.y:
			$AnimatedSprite2D.animation = "bottom_right"
		if player.position.x >= position.x && player.position.y < position.y:
			$AnimatedSprite2D.animation = "top_right"
		if player.position.x < position.x && player.position.y >= position.y:
			$AnimatedSprite2D.animation = "bottom_left"
		if player.position.x < position.x && player.position.y < position.y:
			$AnimatedSprite2D.animation = "top_left"
	else:
		if $AnimatedSprite2D.animation != "happy":
			$AnimatedSprite2D.animation = "sad"

func _physics_process(delta):
	for item in get_overlapping_bodies():
		if !Input.is_action_pressed("action"):
			item.queue_free()
			trash_score += 1
