extends Node2D

@onready var _fade : ColorRect = $CanvasLayer/Fade
@onready var _continue : Button = $CanvasLayer/Buttons/Continue

func _ready():
	_fade.visible = true
	if File.save_file_exists():
		_continue.disabled = false
	_fade.fade_to_clear()

func _change_scene(path : String):
	await _fade.fade_to_black()
	get_tree().change_scene_to_file(path)

func _on_new_game_pressed() -> void:
	File.new_game()
	_change_scene("res://Scenes/game.tscn")

func _on_continue_pressed() -> void:
	File.load_game()
	_change_scene("res://Scenes/level_select.tscn")
