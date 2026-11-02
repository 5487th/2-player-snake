extends CanvasLayer

@export var player_1_wins_display:Control
@export var player_2_wins_display:Control
@export var draw_display:Control
@export var transition_animation_player:AnimationPlayer

@export var replay_button:Button

@export var click_sound_player:AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameSceneToReplayScreenData.winner_snake == GameSceneToReplayScreenData.Winner.SNAKE_1:
		player_1_wins_display.visible = true
		player_2_wins_display.visible=false
		draw_display.visible=false
	elif GameSceneToReplayScreenData.winner_snake == GameSceneToReplayScreenData.Winner.SNAKE_2:
		player_1_wins_display.visible = false
		player_2_wins_display.visible = true
		draw_display.visible=false
	elif GameSceneToReplayScreenData.winner_snake == GameSceneToReplayScreenData.Winner.DRAW:
		player_1_wins_display.visible = false
		player_2_wins_display.visible = false
		draw_display.visible=true
	
	replay_button.pressed.connect(on_replay_pressed)
	
func on_replay_pressed():
	click_sound_player.play()
	transition_animation_player.play("fade_in")
	if transition_animation_player.is_playing():
		await  transition_animation_player.animation_finished
	if click_sound_player.playing:
		await click_sound_player.finished
		
	SceneManager.to_game_scene()
