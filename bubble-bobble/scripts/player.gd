extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_direction = 1 # 1 is right, -1 is left
var bubble_scene = preload("res://scenes/entities/projectiles/bubble.tscn")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$JumpSound.play() # PLAY JUMP SOUND

	# Get input direction (-1 for left, 1 for right, 0 for still)
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		velocity.x = direction * SPEED
		facing_direction = direction # Remember which way we are looking
		$Sprite2D.flip_h = (direction < 0) # Flip sprite if walking left
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle Shooting
	if Input.is_action_just_pressed("fire"):
		var b = bubble_scene.instantiate()
		b.direction = facing_direction
		b.position = position + Vector2(30 * facing_direction, 10)
		get_parent().add_child(b)
		$ShootSound.play() # PLAY SHOOT SOUND (Added here!)

	move_and_slide()

func take_damage():
	$DamageSound.play() # PLAY DAMAGE SOUND
	
	# 1. Reduce lives in our global manager
	GameManager.lives -= 1
	print("Lives left: ", GameManager.lives)

	# 2. Check for Game Over
	if GameManager.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/screens/game_over.tscn")
	else:
		# Reset to start position
		position = Vector2(-8, 0)
