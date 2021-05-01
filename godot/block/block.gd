extends StaticBody2D

var grid_size: int = 32

export var height: int = 1
export var width: int = 1

func _draw():
	var rect = Rect2(0, 0, grid_size * width, grid_size * height)
	draw_rect(rect, Color(0.4, 0.4, 0.4))
