extends Node2D

var path : String = ""
var object_pool : Array = []

var object_bottle = load("res://trash_objects/bottle.tscn")
var object_can = load("res://trash_objects/can.tscn")
var object_mug = load("res://trash_objects/mug.tscn")
var object_banana = load("res://trash_objects/banana.tscn")

func _ready():
	object_pool.append(object_bottle)
	object_pool.append(object_can)
	object_pool.append(object_mug)
	object_pool.append(object_banana)
	
	var trash_count : int = object_pool.size()	
	
	for i in trash_count : 
		var random_object_number = randi() % object_pool.size()
		spawn_trash_objects(object_pool[random_object_number])
		object_pool.remove_at(random_object_number)


func spawn_trash_objects(object):
	var newobject = object.instantiate()
	newobject.set_position(Vector2(randf(), randf()) * (get_viewport_rect().size - Vector2(20,20)) + Vector2(10,10))
	get_parent().add_child(newobject)



