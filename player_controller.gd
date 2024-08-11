extends CharacterBody2D

const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var ground_level : float

func _ready():
	ground_level = global_position.y

func _physics_process(delta):
	if global_position.y < ground_level:
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		global_position.y = ground_level
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()
