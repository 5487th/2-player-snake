extends Node

@export var play_button:Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)
	pass # Replace with function body.

func on_play_pressed():
	SceneManager.to_game_scene()
	
