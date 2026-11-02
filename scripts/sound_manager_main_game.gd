extends Node2D

@export var snake_interaction_manager:SnakeInteractionManager

@export var death_sound_player:AudioStreamPlayer2D
@export var eat_sound_player:AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake_interaction_manager.snake1_died.connect(death)
	snake_interaction_manager.snake2_died.connect(death)
	snake_interaction_manager.draw_happened.connect(death)
	
	snake_interaction_manager.snake_eat.connect(eat)

func death():
	death_sound_player.play()

func eat():
	eat_sound_player.play()
