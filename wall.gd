extends TileMap

#var player_jumping : bool = false

func wall_hitbox_entered(area):
	print("GAME OVER, " + area.name)

func cleared_hitbox_exited(area):
	print("Player cleared +1")
