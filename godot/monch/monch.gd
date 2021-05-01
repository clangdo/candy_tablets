extends KinematicBody2D

export var color: Color = Color(0, 0, 0)
export var gravity: Vector2 = Vector2(0, 10)
export var max_speed: Vector2 = Vector2(512, 0)
export var radius: float = 128.0

var velocity: Vector2 = Vector2(0, 0)
var acceleration: Vector2 = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Collider.shape.radius = radius

func _physics_process(delta):
	velocity += gravity
	velocity.x = 0.0

	if Input.is_action_pressed("right"):
		velocity.x += max(velocity.x + max_speed.x, 0)

	if Input.is_action_pressed("left"):
		velocity.x += min(velocity.x - max_speed.x, 0)

	var _col = move_and_collide(velocity * delta)

func _draw():
	draw_circle(Vector2(0, 0), radius, color)
