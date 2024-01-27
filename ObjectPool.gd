extends Node2D
	
var object = load("res://trash_objects/banana.tscn")
var trash_count = 4

func _ready():
	for i in trash_count : 
		spawn_trash_objects()

	
func spawn_trash_objects():
	var newobject = object.instantiate()
	newobject.set_position(Vector2(randf(), randf()) * get_viewport_rect().size - Vector2(50,50))
	get_parent().add_child(newobject)



