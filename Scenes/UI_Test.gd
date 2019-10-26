extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var CardContainer : = $HBoxContainer
onready var CardBase = preload("res://Scenes/CardBase.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var new_card = CardBase.instance()

		print(CardContainer)
		CardContainer.add_child(new_card)
		new_card.texture = load("res://Assets/placeholders/card.png")
		#new_card.rect_size
		print(new_card.rect_size)
		#print(CardContainer.get_children())
		#print(CardContainer.get_children())
#	pass
