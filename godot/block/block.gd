extends StaticBody2D

var grid_size: int = 32

export var width: int = 1
export var height: int = 1

var _half_size: Vector2 = Vector2(16, 16)

func _ready():
	_half_size = Vector2(grid_size * width, grid_size * height) / 2
	add_collider()

func _draw():
	var rect = Rect2(-_half_size, _half_size * 2)
	draw_rect(rect, Color(0.4, 0.4, 0.4))

func add_collider():
	# This is a terrible API
	var shape_owner_id = create_shape_owner(self)
	var collider_shape = RectangleShape2D.new()
	collider_shape.extents = _half_size
	shape_owner_add_shape(shape_owner_id, collider_shape)
