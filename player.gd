extends CharacterBody2D



const GRAVITY = 1000
const MAX_VEL = 600
const FLAP_SPEED = -400
var flying = false
var falling = false
const START_POS = Vector2(100, 400)

func _ready():
	reset()

func reset():
	velocity = Vector2(0,0)
	falling = false
	flying = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta):
	if flying or falling:
		# new
		var collision = move_and_collide(velocity * delta)
		if collision:
			velocity = velocity.bounce(collision.get_normal()) 
		
		
		velocity.y += GRAVITY * delta
		if velocity.y >= MAX_VEL:
			velocity.y = MAX_VEL
		if flying:
			set_rotation(deg_to_rad(velocity.y * 0.05))
			$AnimatedSprite2D.play()
		elif falling:
			set_rotation(PI/2)
			$AnimatedSprite2D.stop()
		move_and_collide(velocity * delta)
	else:
		$AnimatedSprite2D.stop()

func flap():
	velocity.y = FLAP_SPEED


func _on_ground_hit() -> void:
	print("ground")
	falling = false
