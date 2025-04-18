class_name Hero extends Character

@export var _has_sword : bool
var _sword : RigidBody2D

func can_equip_sword() -> bool:
	return not _has_sword && not _is_dead

func equip_sword(sword : RigidBody2D):
	_sword = sword
	_has_sword = true

func drop_sword():
	if not _has_sword:
		return
	_has_sword = false
	_sword.be_dropped(global_position)
	_sword = null

func _die():
	if _has_sword:
		drop_sword()
	super._die()
