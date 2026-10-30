extends Node2D
class_name SnakeSegment

@export var player_number:Snake.PlayerNumber = Snake.PlayerNumber.PLAYER1:
	get:
		return player_number
	set(value):
		player_number=value
		if player_number == Snake.PlayerNumber.PLAYER1:
			visual.modulate="#4169e1"
		else:
			visual.modulate="#ff0000"

@export var visual:TextureRect
