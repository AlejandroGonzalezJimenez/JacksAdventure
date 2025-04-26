extends Node2D

@onready var _fade : ColorRect = $CanvasLayer/Fade

func _ready() -> void:
	_fade.visible = true
	get_tree().paused = false
	File.save_game()
	_fade.fade_to_clear()

func _on_level_selected(world : int, level : int):
	File.data.world = world
	File.data.level = level
	await _fade.fade_to_black()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_exit_pressed() -> void:
	await _fade.fade_to_black()
	get_tree().change_scene_to_file("res://Scenes/title.tscn")
