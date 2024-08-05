extends Node2D

var rails_prefab = preload("res://rail_map.tscn")

func _ready():
	spawn_rails()

func spawn_rails():
	var instance = rails_prefab.instantiate()
	
	add_child(instance)
	
	var second_instance = rails_prefab.instantiate()
	second_instance.global_position = Vector2(32 * 16, 0)
	
	add_child(second_instance)

func _process(delta):
	global_position.x -= 100 * delta
