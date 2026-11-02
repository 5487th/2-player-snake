extends Node2D

@export var snake_movement:SnakeMovement
@export var snake:Snake

@export var up_sound_player:AudioStreamPlayer2D
@export var down_sound_player:AudioStreamPlayer2D
@export var left_sound_player:AudioStreamPlayer2D
@export var right_sound_player:AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if snake_movement.can_move:
		if snake.player_number == Snake.PlayerNumber.PLAYER1:
			if Input.is_action_just_pressed('up_1'):
				up_sound_player.play()
			elif Input.is_action_just_pressed("down_1"):
				down_sound_player.play()
			elif Input.is_action_just_pressed("left_1"):
				left_sound_player.play()
			elif Input.is_action_just_pressed("right_1"):
				right_sound_player.play()
		elif snake.player_number == Snake.PlayerNumber.PLAYER2:
			if Input.is_action_just_pressed('up_2'):
				up_sound_player.play()
			elif Input.is_action_just_pressed("down_2"):
				down_sound_player.play()
			elif Input.is_action_just_pressed("left_2"):
				left_sound_player.play()
			elif Input.is_action_just_pressed("right_2"):
				right_sound_player.play()
