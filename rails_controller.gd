extends Node2D

var rails_prefab = preload("res://rail_piece.tscn")

var deleted_rails : int = 0

var rails : Array[TileMap]

signal rail_gone

func _ready():
	initial_rails()
	
	rail_gone.connect(new_rail)

func initial_rails():
	for i in range(4):
		spawn_rail()

func new_rail():
	rails.pop_front()
	deleted_rails += 1
	print(deleted_rails)
	spawn_rail()

func spawn_rail():
	var instance = rails_prefab.instantiate()
	
	if rails.back() != null:
		instance.global_position = rails.back().global_position + Vector2(32 * 16, 0)
	else:
		instance.global_position = Vector2(-32 * 16, 0)
	
	rails.append(instance)
	add_child(instance)

func _process(delta):
	for rail in rails:
		rail.global_position.x -= 75 * delta
