extends CharacterBody2D

@export var jump_velocity = 500.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_velocity
	
	move_and_slide()

func player_collided(area : Area2D):
	print(area.name)
