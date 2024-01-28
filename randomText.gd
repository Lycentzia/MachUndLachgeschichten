extends RichTextLabel

var arrayWithJokes = [
	"Genetiv ins Wasser, weil es Dativ ist.", 
	"Eichhörnchen leben im Winter ja von ihren Ersparnüssen.",
	"Wie nennt man russische Veganer? - Mooskauer", 
	"Wissenschaftler haben herausgefunden – und sind wieder reingegangen.",
	"Wann gehen U-Boote unter? – Am Tag der offenen Tür",
	"Warum klaut Robin Hood Deodorant? – Um es unter den Armen zu verteilen",
	"Wie nennt man den Flur eines Iglus? – Eisdiele.",
	"Was ist das Lieblingsessen von Models? –Laufsteaks",
	"Heute wurde jemand mit einer Sellerie mitten auf der Straße erschlagen, war wohl jemand von den Health Angels.",
	"Ist Kegeln mit Thomas Anders als mit Dieter Bowlen",
	"Wenn sich ein Wissenschaftler ein Brötchen belegt, ist es dann wissenschaftlich belegt?",
	"Der Kopierer rückt die Vorlage nicht mehr raus. Ist wohl ein Raubkopierer.",
	"Letztens 'nen Typen namens Simon getroffen und er hat mir das Du angeboten. Nenne ihn ab jetzt Dumon."
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var randomJoke = arrayWithJokes[randi() % arrayWithJokes.size()]
	add_text(randomJoke)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
