extends Node2D

var object_pool : Array = []
var numbers = 0

var object_bottle = load("res://trash_objects/bottle.tscn")
var object_greenbottle = load("res://trash_objects/greenbottle.tscn")
var object_box = load("res://trash_objects/box.tscn")
var object_can = load("res://trash_objects/can.tscn")
var object_tunacan = load("res://trash_objects/tunacan.tscn")
var object_mug = load("res://trash_objects/mug.tscn")
var object_papercup = load("res://trash_objects/papercup.tscn")
var object_pizza = load("res://trash_objects/pizza.tscn")
var object_spray = load("res://trash_objects/spray.tscn")
var object_coke = load("res://trash_objects/coke.tscn")
var object_jar = load("res://trash_objects/jar.tscn")
var object_paperbag = load("res://trash_objects/paperbag.tscn")
var object_newspaper = load("res://trash_objects/newspaper.tscn")
var object_milk = load("res://trash_objects/milk.tscn")
var object_washingagent = load("res://trash_objects/washingagent.tscn")
var object_waterbottle = load("res://trash_objects/waterbottle.tscn")

var finished = false

func _ready():
	object_pool.append(object_bottle)
	object_pool.append(object_greenbottle)
	object_pool.append(object_can)
	object_pool.append(object_box)
	object_pool.append(object_papercup)
	object_pool.append(object_mug)	
	object_pool.append(object_milk)	
	object_pool.append(object_pizza)
	object_pool.append(object_spray)
	object_pool.append(object_coke)
	object_pool.append(object_tunacan)
	object_pool.append(object_jar)
	object_pool.append(object_paperbag)
	object_pool.append(object_newspaper)
	object_pool.append(object_washingagent)
	object_pool.append(object_waterbottle)
	
	
	for i in Globals.trashNumber : 
		var random_object_number = randi() % object_pool.size()
		spawn_trash_objects(object_pool[random_object_number])
		object_pool.remove_at(random_object_number)

	$Camera2D.target = $Player
	


func spawn_trash_objects(object):
	var newobject = object.instantiate()
	newobject.set_position(Vector2(randf(), randf()) * get_viewport_rect().size)
	get_parent().add_child(newobject)

func _process(delta):
	if $Trashcan.trash_score == Globals.trashNumber:
		$Trashcan/AnimatedSprite2D.animation = "happy"
		if (!finished):
			finished = true
			Globals.levels_finished += 1
			Globals.trashNumber +=1
			$Camera2D.add_trauma(1)
			$Player.is_confused = true
			$Laughter.play()

func _on_laughter_finished():
	if (Globals.levels_finished < 3):
		get_tree().change_scene_to_file("res://continueScreen.tscn")
	else:
		get_tree().change_scene_to_file("res://end_screen.tscn")
