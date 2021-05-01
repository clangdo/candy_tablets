extends StaticBody2D

var height: int = 32
var width: int = 32

func _draw():
	var rect = Rect2(Vector2(0, 0), Vector2(width, height))
	draw_rect(rect, Color(0.4, 0.4, 0.4))

func _ready():
	pass
