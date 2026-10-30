extends Node2D
class_name Snake

enum PlayerNumber {
	PLAYER1,
	PLAYER2
}

@export var player_number = PlayerNumber.PLAYER1

@export var top_boundary:Node2D
@export var bottom_boundary:Node2D
@export var left_boundary:Node2D
@export var right_boundary:Node2D
