extends RichTextLabel
@export var dialoge = [
	"Khole: Mom, why did you call this meeting?",
	"Mom: Girls, im holding a meeting.",
	"Khole: I literally just said that.",
	"Mom: You three need to change.",
	"Khortney: I like me tjust the way I am.",
	"Mom: You're the oldest siblings and your are setting up a bad example.",
	"Khole: Setting a bad exaple for who?",
	"Mom: Kylie, Kendall, The other one.",
	"Khorney: How?",
	"Mom: Look at Kim, Look what she is doing right now.",
	"Kim:...What?",
	"Mom: What are you on the internet right now?",
	"Kim: Nothing.",
	"Mom: Shopping?",
	"Kim: NO!",
	"Kim: I'm looking at the president's incubation.",
	"Mom: This is my point!",
	"Mom: You girls are so used to having money and everything at your finger tips.",
	"Mom: that you're lost touch with humanity.",
	"Kholoe: Oh my god, fine.",
	"Kholoe: Whats's her snapchat name?",
	
]
var index = 0 
var string = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = dialoge[index]
	
	text = dialoge[index]
	$AudioStreamPlayer.play()

func next_line():
	index += 1
	
	if index >= dialoge.size():
		index = 0 #reset to beginning
	text = dialoge[index]
	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		next_line()

		
	pass
