extends Node

@export var play_button:Button
@export var click_sound_player:AudioStreamPlayer2D
@export var transition:AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(on_play_pressed)

func on_play_pressed():
	transition.play("fade_in")
	click_sound_player.play()
	
	if transition.is_playing():
		await transition.animation_finished
	if click_sound_player.playing:
		await click_sound_player.finished
		
	await get_tree().create_timer(0.5).timeout
	
	
	SceneManager.to_game_scene()
	
