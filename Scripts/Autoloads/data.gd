class_name Data extends Resource

enum Progress
{
	UNLOCKED		= 1,
	COMPLETED		= 2,
	CHEST_OPENED	= 4,
}

@export var world : int
@export var level : int
@export var coins : int
@export var lives : int
@export var checkpoint : int
@export var has_key : bool
@export var progress : Array[Array]

func _init():
	world = 1
	level = 1
	coins = 0
	lives = 3
	checkpoint = 0
	has_key = false
	progress = [[Progress.UNLOCKED, 0, 0, 0]]

func set_progress_marker(marker : Progress, world_id : int = world, level_id : int = level, on : bool = true):
	if world_id <= 0 || world_id > progress.size() || level_id <= 0 || level_id > progress[world_id - 1].size(): 
		push_warning("Invalid set progress marker index at world " + str(world_id) + " level " + str(level_id))
		return
	if on:
		progress[world_id - 1][level_id - 1] |= marker
	else:
		progress[world_id - 1][level_id - 1] &= !marker

func check_progress_marker(marker : Progress, world_id : int = world, level_id : int = level) -> bool:
	if world_id <= 0 || world_id > progress.size() || level_id <= 0 || level_id > progress[world_id - 1].size(): 
		push_warning("Invalid check progress marker index at world " + str(world_id) + " level " + str(level_id))
		return false
	return progress[world_id - 1][level_id - 1] & marker

func reset(game_over : bool):
	if game_over:
		coins = 0
		lives = 3
	checkpoint = 0
	has_key = false
