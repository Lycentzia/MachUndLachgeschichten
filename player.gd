extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var inventory = []
var capacity = 1
var is_confused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size / 2

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.animation = "right"
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.animation = "left"
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.animation = "down"
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.animation = "up"
		velocity.y -= 1
	
	if Input.is_action_pressed("action"):
		$AnimatedSprite2D_star.show()
		$AnimatedSprite2D_star.play()
	else:
		$AnimatedSprite2D_star.stop()
		$AnimatedSprite2D_star.hide()

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if (is_confused):
		$AnimatedSprite2D_confusion.show()
		$AnimatedSprite2D_confusion.play()
	else:
		$AnimatedSprite2D_confusion.hide()
		$AnimatedSprite2D_confusion.stop()

func _physics_process(delta):
	if Input.is_action_pressed("action"):
		for item in get_overlapping_bodies():
			if (item.is_trash && inventory.size() < capacity):
				item.get_parent().remove_child(item)
				add_child(item)
				inventory.append(item)
				item.visible = 0
	else:
		for item in inventory:
			remove_child(item)
			get_parent().add_child(item)
			item.position = position
			item.visible = 1
		inventory.clear()

		
