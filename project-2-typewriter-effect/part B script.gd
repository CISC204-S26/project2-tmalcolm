extends RichTextLabel

@export var dialogue = [
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
	"Khloe: Whats's her snapchat name?"
]

var index = 0

func _ready() -> void:
	show_dialogue()

func next_line():
	index += 1

	if index >= dialogue.size():
		index = 0

	show_dialogue()

func show_dialogue():
	var full_line = dialogue[index]
	var current_text = ""

	for character in full_line:
		current_text += character
		text = current_text
		await get_tree().create_timer(0.02).timeout

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			next_line()

	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			next_line()
