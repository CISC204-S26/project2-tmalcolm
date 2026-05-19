extends RichTextLabel
@export var dialoge = [
	"Khloe: Mom, why did you call this meeting?",
	"Mom: Girls, im holding a meeting.",
	"Khloe: I literally just f*cking said that.",
	"Mom: You three need to change.",
	"Kourtney: I like me just the way I am.",
	"Mom: You're the oldest siblings and your are setting up a bad example.",
	"Khloe: Setting a bad exaple for who?",
	"Mom: Kylie, Kendall, The other one.",
	"Kourtney: How?",
	"Mom: Look at Kim, Look what she is doing.",
	"Kim:...",
	"Kim: What?",
	"Mom: What are you on the internet right now?",
	"Kim: Nothing.",
	"Mom: Shopping?",
	"Kim: NO!",
	"Kim: I'm looking at the president's incubation.",
	"Mom: This is my point!",
	"Mom: You girls are so used to having money and everything at your finger tips.",
	"Mom: that you're lost touch with humanity.",
	"Khloe: Oh my god, fine.",
	"Khloe: Whats's her snapchat name?",
	"Mom: What?",
	"Khloe: What's her snapchat?",
	"Khloe: We'll give her a snap so you can shut up.",
	"Kourtney: Oh my god, what do you want us to do?",
	"Mom: In order to keep you grounded,",
	"Mom: you three will be poor for a day.",
	".",
	"..",
	"...",
	"Khloe: What is that?",
	"Mom: What is what?",
	"Kim: What word you said.",
	"Mom: Grounded?",
	"Kourtney: No, the word that started with a P.",
	"Mom: Poor?",
	"Khloe: Yeah that. What is that?",
	"Mom: You really don't know what poor means?",
	"Kim: You literally just made that word up!",
	"Kim: It's not even real.",
	"Khorney: Who does that?",
	"Mom: You girls will each be living in a small apartment,",
	"Mom: With no credit cards, little money, and just enough food.",
	"Khloe:Oh my god what?",
	"Kim: Why did you do that?",
	"Kourtney:No, Mommy, I love you please.:(",
	"Mom: It's for your own good."
	
	
]
var index = 0 
var string = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = dialoge[index]
	
	


func next_line():
	index += 1

	
	if index >= dialoge.size():
		index = 0 #reset to beginning
	
	text = dialoge[index]
	 
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			next_line()

	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			next_line()

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	

		
	pass
