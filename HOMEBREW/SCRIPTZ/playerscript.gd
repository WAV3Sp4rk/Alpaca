extends CharacterBody2D

var max_speed = 100
var last_direction := Vector2(1, 0)

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()
	
	if direction.length() > 0:
		last_direction = direction
		play_walk_animation(direction)
	else:
		play_idle_animation()

func play_walk_animation(direction): 
	if direction.x > 0:
		$AnimatedSprite2D.play("walk right")
	elif direction.x < 0:
		$AnimatedSprite2D.play("walk left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("walk down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("walk up")

func play_idle_animation():
	# Use >= so that if horizontal and vertical components are equal, horizontal is prioritized.
	if abs(last_direction.x) >= abs(last_direction.y):
		if last_direction.x > 0:
			$AnimatedSprite2D.play("idle right")
		else:
			$AnimatedSprite2D.play("idle left")
	else:
		if last_direction.y > 0:
			$AnimatedSprite2D.play("idle down")
		else:
			$AnimatedSprite2D.play("idle up")
