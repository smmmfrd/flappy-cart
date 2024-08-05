extends TileMap

func _process(delta):
	if global_position.x <= -64 * 16:
		get_parent().emit_signal("rail_gone")
		queue_free()
