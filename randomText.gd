extends RichTextLabel

var arrayWithJokes = [
	"Test1", 
	"Test2"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var randomJoke = arrayWithJokes[randi() % arrayWithJokes.size()]
	add_text(randomJoke)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
