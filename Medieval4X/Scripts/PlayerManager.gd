class_name PlayerManager
# Owned tiles is an array of tiles owned by the player
var owned_tiles
var owned_ressources

func _init():
	owned_tiles = []
	compute_start_ressources()

func compute_start_ressources():
	var file = File.new()
	file.open("res://Config/ressources_config.json",file.READ)
	var txt = file.get_as_text()
	file.close()
	owned_ressources = parse_json(txt)["START_PLAYER_RESSOURCES"]


func add_tile(tile: Tile):
	owned_tiles.append(tile)

func wait(seconds):
	var start = OS.get_ticks_msec()
	while (OS.get_ticks_msec() - start)*1000 < seconds: 
		pass

func update_owned_ressources():
	for tile in owned_tiles:
		for key in tile.available_ressources:
			owned_ressources[key] += tile.available_ressources[key]

func get_ressources_str():
	var s = "Player ressources :\n"
	s    += str(owned_ressources) + "\n"
	return s

