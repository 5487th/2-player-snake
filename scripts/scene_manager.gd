extends Node

const main_scene = "res://scenes/main.tscn"
const main_game_scene = "res://scenes/main_game.tscn"
const replay_scene = "res://scenes/replay_menu.tscn"

func to_main_menu_scene():
	get_tree().change_scene_to_file(main_scene)

func to_game_scene():
	get_tree().change_scene_to_file(main_game_scene)

func to_replay_scene():
	get_tree().change_scene_to_file(replay_scene)
