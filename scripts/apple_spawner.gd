extends Node2D
class_name AppleSpawner

@export var top_boundary:Node2D
@export var bottom_boundary:Node2D
@export var left_boundary:Node2D
@export var right_boundary:Node2D

@export var apple_scene:PackedScene

@export var snake_1:Snake
@export var snake_2:Snake

var current_apple:Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_apple()
	
func spawn_apple():
	var availalable_spots:Array[Vector2] = []
	
	for i in range(0, bottom_boundary.global_position.y, 64):
		for j in range(0, right_boundary.global_position.x, 64):
			availalable_spots.append(Vector2(j, i))
	
	#filtering out the position of snake 1
	availalable_spots.erase(snake_1.snake_movement.global_position)
	
	for segment in snake_1.snake_movement.segments:
		availalable_spots.erase(segment.position)
	
	#filtering out the position of snake 2
	availalable_spots.erase(snake_2.snake_movement.global_position)
	
	for segment in snake_2.snake_movement.segments:
		availalable_spots.erase(segment.position)
	
	var spawn_position = availalable_spots.pick_random()
	
	var spawned_apple:Node2D = apple_scene.instantiate()
	add_child(spawned_apple)
	spawned_apple.global_position=Vector2(spawn_position.x+32, spawn_position.y+32)
	current_apple = spawned_apple
	
func remove_apple():
	if current_apple:
		current_apple.queue_free()
	spawn_apple()
	
