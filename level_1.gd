extends Node2D

var path : String = ""
var object_pool : Array = []

var object_bottle = load("res://trash_objects/bottle.tscn")
var object_can = load("res://trash_objects/can.tscn")
var object_mug = load("res://trash_objects/mug.tscn")
var object_banana = load("res://trash_objects/banana.tscn")

var finished = false

func _ready():
	object_pool.append(object_bottle)
	object_pool.append(object_can)
	object_pool.append(object_banana)
	object_pool.append(object_mug)	
	
	for i in object_pool : 
		spawn_trash_objects(i)

	$Camera2D.target = $Player
	

func spawn_trash_objects(object):
	var newobject = object.instantiate()
	newobject.set_position(Vector2(randf(), randf()) * (get_viewport_rect().size - Vector2(20,20)) + Vector2(10,10))
	get_parent().add_child(newobject)

func _process(delta):
	if $Trashcan.trash_score == object_pool.size():
		$Trashcan/AnimatedSprite2D.animation = "happy"
		if (!finished):
			finished = true
			$Camera2D.add_trauma(1)
			$Player.is_confused = true
			$Timer.start()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://menu.tscn")
