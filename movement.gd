extends CharacterBody2D
const SPEED = 500.0
const JUMP_VELOCITY = -400
var position_history: Array[Vector2] = []

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += JUMP_VELOCITY
	var direction := Input.get_axis("left", "right") 
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(direction, 0, SPEED)
	move_and_slide()
	position_history.append(global_position)
	if position_history.size() > 600:
		position_history.pop_front()
