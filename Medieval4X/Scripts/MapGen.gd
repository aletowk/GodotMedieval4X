extends Node2D

var noise
var map_size = Vector2(80, 60)
var mountain_cap = 0.7
var water_cap = 0

var TILEMAP_CONF = {
					"ocean" 	: {"id" : 2, "cap" : -0.6},
					"water" 	: {"id" : 4, "cap" : -0.1},
					"sand" 		: {"id" : 3, "cap" : 0.1},
					"grass"    	: {"id" : 0, "cap" : 0.7},
					"mountain" 	: {"id" : 1, "cap" : 0.8},
					"snow" 		: {"id" : 5, "cap" : 0.9}
				   }

func _ready():
	randomize()
	noise = OpenSimplexNoise.new()
	noise.seed = 0
	noise.octaves = 1.0
	noise.period = 12
	noise.persistence = 0.2
	make_map()
		
			
func make_map():
	for x in map_size.x:
		for y in map_size.y:
			var noise_val = noise.get_noise_2d(x,y)
			if(noise_val < TILEMAP_CONF["ocean"]["cap"]):
				$TileMap.set_cell(x,y,TILEMAP_CONF["ocean"]["id"])
			elif(noise_val < TILEMAP_CONF["water"]["cap"]):
				$TileMap.set_cell(x,y,TILEMAP_CONF["water"]["id"])
			elif(noise_val < TILEMAP_CONF["sand"]["cap"]):
				$TileMap.set_cell(x,y,TILEMAP_CONF["sand"]["id"])
			elif(noise_val < TILEMAP_CONF["grass"]["cap"]):
				$TileMap.set_cell(x,y,TILEMAP_CONF["grass"]["id"])
			elif(noise_val < TILEMAP_CONF["mountain"]["cap"]):
				$TileMap.set_cell(x,y,TILEMAP_CONF["mountain"]["id"])
			else:
				$TileMap.set_cell(x,y,TILEMAP_CONF["snow"]["id"])
				

func _process(delta):	
	if(Input.is_action_just_released("left_click")):
		var mousePos = get_global_mouse_position()
		mousePos.x /= $TileMap.cell_size.x
		mousePos.y /= $TileMap.cell_size.y 
		var ind = $TileMap.get_cell(int(mousePos.x),int(mousePos.y))
		if(ind != -1):
			print("Cell at index : ",Vector2(int(mousePos.x),int(mousePos.y)))
			print("Has Type : ",ind)
		
