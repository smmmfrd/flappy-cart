extends Node2D

@export var level_speed = 75

const RAILS_PREFAB = preload("res://rail_piece.tscn")
const WALL_PREFAB = preload("res://wall.tscn")
var deleted_rails : int = 1

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
	spawn_rail()

func spawn_rail():
	var instance : Node = RAILS_PREFAB.instantiate()
	
	if len(rails) != 0:
		if deleted_rails > 0 and deleted_rails % 2 == 0:
			spawn_wall(instance)
		
		instance.global_position = rails.back().global_position + Vector2(32 * 16, 0)
	else:
		instance.global_position = Vector2(-32 * 16, 0)
	
	rails.append(instance)
	add_child(instance)

func spawn_wall(parent : Node):
	var instance = WALL_PREFAB.instantiate()
	
	parent.add_child(instance)

func _process(delta):
	var global_movement = -level_speed * delta
	for rail in rails:
		rail.global_position.x += global_movement
