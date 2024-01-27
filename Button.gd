extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if (Input.is_action_just_pressed("action")):
		_on_pressed()


func _on_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")
