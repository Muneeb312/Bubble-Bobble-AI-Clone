extends Area2D

var direction = 1
var speed = 200
var float_up = false
var trapped_scene = preload("res://scenes/entities/projectiles/trapped_bubble.tscn")

func _ready():
	# After 0.5 seconds, stop moving forward and start floating up
	await get_tree().create_timer(0.5).timeout
	float_up = true

func _physics_process(delta):
	if not float_up:
		position.x += direction * speed * delta
	else:
		position.y -= (speed / 2) * delta # Float upwards

func _on_timer_timeout():
	queue_free() # Destroys the bubble after 3 seconds


func _on_body_entered(body):
	if body.is_in_group("enemies"):
		var trapped_bubble = trapped_scene.instantiate()
		SfxManager.get_node("TrapSound").play()
		
		trapped_bubble.global_position = body.global_position
		
	
		get_tree().root.add_child(trapped_bubble)
		
	
		body.queue_free()      
		queue_free()         
