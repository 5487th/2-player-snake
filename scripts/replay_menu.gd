extends CanvasLayer

@export var player_1_wins_display:Control
@export var player_2_wins_display:Control

@export var replay_button:Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameSceneToReplayScreenData.winner_snake == Snake.PlayerNumber.PLAYER1:
		player_1_wins_display.visible = true
		player_2_wins_display.visible=false
		
	elif GameSceneToReplayScreenData.winner_snake == Snake.PlayerNumber.PLAYER2:
		player_1_wins_display.visible = false
		player_2_wins_display.visible = true
	
	replay_button.pressed.connect(on_replay_pressed)
	
func on_replay_pressed():
	SceneManager.to_game_scene()
