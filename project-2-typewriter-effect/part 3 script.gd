extends RichTextLabel

@export var dialogue = [
	"[b]Khloe:[/b] Mom, why did you call this meeting?",
	"[b]Mom:[/b] Girls, im holding a meeting.",
	"[b][color=hotpink]Khloe:[/color][/b] I literally just [i]f*cking[/i] said that.",
	"[b]Mom:[/b] You three need to [color=red]change[/color].",
	"[b]Kourtney:[/b] I like me just the way I am.",
	"[b]Mom:[/b] You're the oldest siblings and you're setting up a bad example.",
	"[b]Khloe:[/b] Setting a bad example for who?",
	"[b]Mom:[/b] Kylie, Kendall, The other one.",
	"[b]Kourtney:[/b] How?",
	"[b]Mom:[/b] Look at [color=cyan]Kim[/color], look what she is doing.",
	"[b]Kim:[/b] ...",
	"[b]Kim:[/b] What?",
	"[b]Mom:[/b] What are you on the internet right now?",
	"[b]Kim:[/b] Nothing.",
	"[b]Mom:[/b] Shopping?",
	"[b][color=pink]Kim:[/color][/b] [b]NO![/b]",
	"[b]Kim:[/b] I'm looking at the president's inauguration.",
	"[b]Mom:[/b] This is my point!",
	"[b]Mom:[/b] You girls are so used to having money and everything at your fingertips.",
	"[b]Mom:[/b] That you've lost touch with humanity.",
	"[b]Khloe:[/b] Oh my god, fine.",
	"[b]Khloe:[/b] What's her snapchat name?",
	"[b]Mom:[/b] What?",
	"[b]Khloe:[/b] What's her snapchat?",
	"[b]Khloe:[/b] We'll give her a snap so you can shut up.",
	"[b]Kourtney:[/b] Oh my god, what do you want us to do?",
	"[b]Mom:[/b] In order to keep you grounded...",
	"[b][color=red]Mom:[/color][/b] You three will be [b]POOR[/b] for a day.",
	".",
	"..",
	"...",
	"[b]Khloe:[/b] What is that?",
	"[b]Mom:[/b] What is what?",
	"[b]Kim:[/b] What word you said.",
	"[b]Mom:[/b] Grounded?",
	"[b]Kourtney:[/b] No, the word that started with a P.",
	"[b]Mom:[/b] Poor?",
	"[b]Khloe:[/b] Yeah that. What is that?",
	"[b]Mom:[/b] You really don't know what poor means?",
	"[b]Kim:[/b] You literally just made that word up!",
	"[b]Kim:[/b] It's not even real.",
	"[b]Kourtney:[/b] Who does that?",
	"[b]Mom:[/b] You girls will each be living in a small apartment.",
	"[b]Mom:[/b] With no credit cards, little money, and just enough food.",
	"[b]Khloe:[/b] Oh my god what?",
	"[b]Kim:[/b] Why did you do that?",
	"[b]Kourtney:[/b] No Mommy, I love you please :(",
	"[b]Mom:[/b] It's for your own good."
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
	var reading_tag = false

	for character in full_line:

		if character == "[":
			reading_tag = true

		current_text += character

		if !reading_tag:
			text = current_text
			await get_tree().create_timer(0.02).timeout

		if character == "]":
			reading_tag = false
			text = current_text

	

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			next_line()

	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			next_line()
