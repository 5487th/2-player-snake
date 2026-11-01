extends Node2D

@export var snake1:Snake
@export var snake2:Snake
@export var apple_spawner:AppleSpawner

signal snake1_died
signal snake2_died
signal draw_happened

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake1.snake_movement.moved.connect(on_snake_1_moved)
	snake2.snake_movement.moved.connect(on_snake_2_moved)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func on_snake_1_moved():
	#snake collision into itself
	for segment in snake1.snake_movement.segments:
		if segment.global_position.is_equal_approx(snake1.snake_movement.global_position):
			snake1_died.emit()
			snake1.snake_movement.can_move=false
			snake2.snake_movement.can_move=false
			GameSceneToReplayScreenData.winner_snake = GameSceneToReplayScreenData.Winner.SNAKE_2
			await  get_tree().create_timer(2.0).timeout
			SceneManager.to_replay_scene()
	
	#snake collision into the other snake
	for segment in snake2.snake_movement.segments:
		if segment.global_position.is_equal_approx(snake1.snake_movement.global_position):
			snake1_died.emit()
			snake1.snake_movement.can_move=false
			snake2.snake_movement.can_move=false
			GameSceneToReplayScreenData.winner_snake = GameSceneToReplayScreenData.Winner.SNAKE_2
			await  get_tree().create_timer(2.0).timeout
			SceneManager.to_replay_scene()
	
	#draw 
	if snake1.snake_movement.global_position == snake2.snake_movement.global_position:
		draw_happened.emit()
		snake1.snake_movement.can_move=false
		snake2.snake_movement.can_move=false
		GameSceneToReplayScreenData.winner_snake=GameSceneToReplayScreenData.Winner.DRAW
		await  get_tree().create_timer(2.0).timeout
		SceneManager.to_replay_scene()
		
	
	#snake eating apple
	if snake1.snake_movement.global_position.is_equal_approx(apple_spawner.current_apple.global_position):
		apple_spawner.remove_apple()
		snake1.snake_movement.add_segment()

func on_snake_2_moved():
	#snake collision into itself
	for segment in snake2.snake_movement.segments:
		if segment.global_position.is_equal_approx(snake2.snake_movement.global_position):
			snake2_died.emit()
			snake1.snake_movement.can_move=false
			snake2.snake_movement.can_move=false
			GameSceneToReplayScreenData.winner_snake = GameSceneToReplayScreenData.Winner.SNAKE_1
			await  get_tree().create_timer(2.0).timeout
			SceneManager.to_replay_scene()
			
	#snake collision into the other snake
	for segment in snake1.snake_movement.segments:
		if segment.global_position.is_equal_approx(snake2.snake_movement.global_position):
			snake2_died.emit()
			snake1.snake_movement.can_move=false
			snake2.snake_movement.can_move=false
			GameSceneToReplayScreenData.winner_snake = GameSceneToReplayScreenData.Winner.SNAKE_1
			await  get_tree().create_timer(2.0).timeout
			SceneManager.to_replay_scene()
	#draw 
	if snake1.snake_movement.global_position == snake2.snake_movement.global_position:
		draw_happened.emit()
		snake1.snake_movement.can_move=false
		snake2.snake_movement.can_move=false
		GameSceneToReplayScreenData.winner_snake=GameSceneToReplayScreenData.Winner.DRAW
		await  get_tree().create_timer(2.0).timeout
		SceneManager.to_replay_scene()
		
	#snake eating apple
	if snake2.snake_movement.global_position.is_equal_approx(apple_spawner.current_apple.global_position):
		apple_spawner.remove_apple()
		snake2.snake_movement.add_segment()
