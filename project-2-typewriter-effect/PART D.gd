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

var current_index = 0

@onready var music = "../music"

# KHLOE
@onready var khloe_normal = $"Happy Face P"
@onready var khloe_confused = $"Confused face P"
@onready var khloe_mad = $"Mad Face P"

# KIM
@onready var kim_normal = $"Normal Face H"
@onready var kim_confused = $"Confused Face H"
@onready var kim_mad = $"Mad Face H"

# MOM
@onready var mom_normal = $"Normal Face J"
@onready var mom_confused = $"Confused Face J"
@onready var mom_mad = $"Mad Face J"

# KOURTNEY
@onready var kourtney_normal = $"Normal Face TT"
@onready var kourtney_confused = $"Confused face TT"
@onready var kourtney_mad = $"Mad Face TT"


func _ready():
	bbcode_enabled = true
	show_dialogue()

func reset_faces():
	# Hide all expressions
	khloe_normal.visible = false
	khloe_confused.visible = false
	khloe_mad.visible = false

	kim_normal.visible = false
	kim_confused.visible = false
	kim_mad.visible = false

	kourtney_normal.visible = false
	kourtney_confused.visible = false
	kourtney_mad.visible = false

	mom_normal.visible = false
	mom_confused.visible = false
	mom_mad.visible = false

	# Show default normals
	khloe_normal.visible = true
	kim_normal.visible = true
	kourtney_normal.visible = true
	mom_normal.visible = true
	
	bbcode_enabled = true
	

func set_expression():
	reset_faces()

	var line = dialogue[current_index]

	if "Khloe:" in line:
		if "f*cking" in line or "shut up" in line:
			khloe_mad.visible = true
			khloe_normal.visible = false
		elif "What?" in line or "snapchat" in line:
			khloe_confused.visible = true
			khloe_normal.visible = false

	if "Kim:" in line:
		if "NO!" in line:
			kim_mad.visible = true
			kim_normal.visible = false
		else:
			kim_confused.visible = true
			kim_normal.visible = false

	if "Kourtney:" in line:
		if "How?" in line:
			kourtney_confused.visible = true
			kourtney_normal.visible = false

	if "Mom:" in line:
		if "change" in line or "POOR" in line or "This is my point" in line:
			mom_mad.visible = true
			mom_normal.visible = false
		else:
			mom_confused.visible = true
			mom_normal.visible = false

func show_dialogue():
	set_expression()

	var full_text = dialogue[current_index]
	var partial_text = ""
	var reading_tag = false

	for char in full_text:
		partial_text += char

		if char == "[":
			reading_tag = true

		if not reading_tag:
			text = partial_text
			await get_tree().create_timer(0.02).timeout

		if char == "]":
			reading_tag = false
			text = partial_text

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		current_index += 1
	elif event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		current_index += 1
	else:
		return
		
		

	if current_index >= dialogue.size():
		music.stop()
		current_index = 0

	show_dialogue()
	
	
