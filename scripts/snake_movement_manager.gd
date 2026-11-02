extends Node2D
class_name SnakeMovement

@export var snake:Snake
@export var timer:Timer
@export var head_visual:TextureRect
@export var segments:Array[SnakeSegment]

@export var can_move:bool = true

signal moved

var movement_direction:Vector2 = Vector2.RIGHT
var last_movement_direction:Vector2 = Vector2(0, 0) 
var segment_scene:PackedScene = load("res://scenes/snake_segment.tscn")


func _ready() -> void:
	if snake.player_number==Snake.PlayerNumber.PLAYER1:
		movement_direction=Vector2.RIGHT
	elif snake.player_number==Snake.PlayerNumber.PLAYER2:
		movement_direction=Vector2.LEFT
		
	#snake visuals
	for segment in segments:
		segment.player_number = snake.player_number
		
	if snake.player_number == Snake.PlayerNumber.PLAYER1:
		head_visual.modulate = "#4169e1"
	else:
		head_visual.modulate = "#ff0000"
	
	timer.timeout.connect(on_move)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	movement_direction = get_movement_direction()
	
	

func on_move():
	if not can_move:
		return
	
	last_movement_direction=movement_direction
	
	var new_positions:Array[Vector2] = []
	
	new_positions.append(global_position)
	
	for segment in segments:
		new_positions.append(segment.global_position)
	
	for i in range(len(segments)):	
		segments[i].global_position = new_positions[i]
		
		#snake visual
		segments[i].player_number = snake.player_number
	
	global_position += movement_direction * 64
	
	#making sure the snake stays in between the bounds
	if global_position.x >= snake.right_boundary.global_position.x:
		global_position.x = int(global_position.x) % int(snake.right_boundary.global_position.x)
	elif global_position.x <= snake.left_boundary.global_position.x:
		global_position.x = snake.right_boundary.global_position.x + global_position.x
	
	if global_position.y <= snake.top_boundary.position.y:
		global_position.y = snake.bottom_boundary.position.y + global_position.y
	elif global_position.y >= snake.bottom_boundary.position.y:
		global_position.y = int(global_position.y) % int(snake.bottom_boundary.position.y)
		
	match movement_direction:
		Vector2.UP:
			global_rotation = deg_to_rad(-90)
		Vector2.DOWN:
			global_rotation = deg_to_rad(90)
			
		Vector2.LEFT:
			global_rotation = deg_to_rad(180)
			
		Vector2.RIGHT:
			global_rotation = deg_to_rad(0)
	
	moved.emit()
	
func get_movement_direction():
	if snake.player_number == Snake.PlayerNumber.PLAYER1:
		if Input.is_action_just_pressed("up_1") and last_movement_direction != Vector2.DOWN:
			return Vector2.UP
		elif Input.is_action_just_pressed("down_1") and last_movement_direction != Vector2.UP:
			return Vector2.DOWN
			
		elif Input.is_action_just_pressed("left_1") and last_movement_direction != Vector2.RIGHT:
			return Vector2.LEFT
			
		elif Input.is_action_just_pressed("right_1") and last_movement_direction != Vector2.LEFT:	
			return Vector2.RIGHT
		else:
			return movement_direction
	
	elif snake.player_number == snake.PlayerNumber.PLAYER2:
		if Input.is_action_just_pressed("up_2") and last_movement_direction != Vector2.DOWN: 
			return Vector2.UP
		elif Input.is_action_just_pressed("down_2") and last_movement_direction != Vector2.UP:
			return Vector2.DOWN
		elif Input.is_action_just_pressed("left_2") and last_movement_direction != Vector2.RIGHT:
			return Vector2.LEFT
		elif Input.is_action_just_pressed("right_2") and last_movement_direction != Vector2.LEFT: 
			return Vector2.RIGHT
		else:
			return movement_direction

func add_segment():
	var segment:SnakeSegment = segment_scene.instantiate()
	segment.player_number = snake.player_number
	get_parent().add_child(segment)
	segment.global_position = segments[len(segments)-1].global_position
	segments.append(segment)
	
	
