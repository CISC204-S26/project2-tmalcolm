extends RichTextLabel
@export var dialoge = [
	"I lay my head on the desk as the teacher does today's lecture.",
	"I wasn't feeling like my best all week.",
	"Assinments after assinments due the next day.",
	"Also my family is getting on my last nerves.",
	"How will this day get any worse?"
]
var index = 0 
var current_line = 0 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RichTextLabel.text = dialoge[index]

func next_line():
	index += 1
	
	if index >= dialoge.size():
		index = 0 #reset to beginning
	RichTextLabel.text = dialoge[index]
	

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
