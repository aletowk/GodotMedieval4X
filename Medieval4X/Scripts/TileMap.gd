extends TileMap

var noise
# var map_size = Vector2(80, 60)
var map_size = Vector2(200, 200)

var tile_array = []

var TILEMAP_CONF = {}

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = randi() % 1000
	noise.octaves = 1.0
	noise.period = 12
	noise.persistence = 0.2

	init_tile_array()

	make_map()

func init_tile_array():
	for x in map_size.x:
		var line = []
		for y in map_size.y:
			line.append([])
		tile_array.append(line)


func read_generation_config():
	var file = File.new()
	file.open("res://Config/procedural_generation_config.json",file.READ)
	var txt = file.get_as_text()
	file.close()
	return parse_json(txt)

func make_map():
	# Read tilemap procedural generation config
	TILEMAP_CONF = read_generation_config()["TILEMAP_PROCEDURAL_CONF"]

	for x in map_size.x:
		for y in map_size.y:
			var noise_val = noise.get_noise_2d(x,y)
			if(noise_val < TILEMAP_CONF["ocean"]["cap"]):
				set_cell(x,y,TILEMAP_CONF["ocean"]["id"])
				set_tile(x,y,TILEMAP_CONF["ocean"]["type"])
			elif(noise_val < TILEMAP_CONF["water"]["cap"]):
				set_cell(x,y,TILEMAP_CONF["water"]["id"])
				set_tile(x,y,TILEMAP_CONF["water"]["type"])
			elif(noise_val < TILEMAP_CONF["sand"]["cap"]):
				set_cell(x,y,TILEMAP_CONF["sand"]["id"])
				set_tile(x,y,TILEMAP_CONF["sand"]["type"])
			elif(noise_val < TILEMAP_CONF["grass"]["cap"]):
				set_cell(x,y,TILEMAP_CONF["grass"]["id"])
				set_tile(x,y,TILEMAP_CONF["grass"]["type"])
			elif(noise_val < TILEMAP_CONF["mountain"]["cap"]):
				set_cell(x,y,TILEMAP_CONF["mountain"]["id"])
				set_tile(x,y,TILEMAP_CONF["mountain"]["type"])
			else:
				set_cell(x,y,TILEMAP_CONF["snow"]["id"])
				set_tile(x,y,TILEMAP_CONF["snow"]["type"])

func set_tile(x : int,y : int, tile_type):
	tile_array[x][y] = Tile.new(tile_type,x,y)

func get_tile(x : int, y : int): 
	if(x >= 0 and x < map_size.x):
		if(y >= 0 and y < map_size.y ):
			return tile_array[x][y]
	return null
	

# func _process(delta):
# 	pass
