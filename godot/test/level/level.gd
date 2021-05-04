extends Node2D

tool

export var wall_scene: PackedScene
export var platform_scene: PackedScene

#Must be positive
const WALL_SPACING: int = 32
const WALL_ARRANGEMENT: String = """
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*                             *
*******************************
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_walls()
	spawn_platforms()

func spawn_walls():
	var place_cursor = Vector2(0, 0)

	for cur_char in WALL_ARRANGEMENT:
		place_cursor = try_spawn_wall(cur_char, place_cursor)

func try_spawn_wall(c: String, cursor: Vector2):
	match c:
		"\n":
			# Newline
			cursor = Vector2(0, cursor.y + WALL_SPACING)
		" ":
			cursor.x += WALL_SPACING
			# Don't spawn walls where there are spaces
		"\r":
			# Ignore carriage returns, all hail the great temple of legacy garbage
			pass
		_:
			# Spawn walls where there are other characters
			var wall = wall_scene.instance()
			wall.position = cursor
			add_child(wall)
			cursor.x += WALL_SPACING
	return cursor

func spawn_platforms():
	var location_nodes: Array = $PlatformLocations.get_children()
	var locations: PoolVector2Array = []

	for location_node in location_nodes:
		locations.append(location_node.position)

	for location in locations:
		spawn_platform(location)

func spawn_platform(where: Vector2):
	var platform = platform_scene.instance()
	platform.position = where
	add_child(platform)
