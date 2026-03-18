extends RichTextLabel
@export var dialoge = [
	"I lay my head on the desk as the teacher does today's lecture.",
	"I wasn't feeling like my best all week.",
	"Assinments after assinments due the next day.",
	"Also my family is getting on my last nerves.",
	"How will this day get any worse?"
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
	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("next"):
		next_line()

		
	pass
