extends Node

@onready var _character = get_parent()
var _is_enabled : bool

func set_enabled(is_enabled : bool):
	_is_enabled = is_enabled
	if not _is_enabled:
		_character.run(0)

func _input(event : InputEvent):
	if not _is_enabled:
		return
	if event.is_action_pressed("jump"):
		_character.jump()
	if event.is_action_released("jump"):
		_character.stop_jump()
	if event.is_action_pressed("attack"):
		_character.attack()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float):
	if not _is_enabled:
		return
	_character.run(Input.get_axis("run_left", "run_right"))
