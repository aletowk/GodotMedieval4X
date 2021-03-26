class_name Tile


var type
var position
var owner_player
var available_ressources
var tile_ressource_config

func _init(_type,pos_x,pos_y):
	type = _type
	position = Vector2(pos_x,pos_y)
	owner_player = "None"
	tile_ressource_config = read_ressource_config()["RESSOURCES_CONF"]
	compute_ressources()

func compute_ressources():
	var max_amount : int = 0
	available_ressources = {}
	if(type in tile_ressource_config):
		for key in tile_ressource_config[type]:
			max_amount = tile_ressource_config[type][key]
			if(max_amount > 0):
				available_ressources[key] = randi() % max_amount

func get_description_str():
	var s = ""
	s += "Tile type    : " + type + "\n"
	s += "Position     : " + str(position.x) + "," + str(position.y) + "\n"
	s += "Owner player : " + owner_player + "\n"
	s += "Available Ressources :\n"
	s += str(available_ressources) + "\n"
	return s

func read_ressource_config():
	var file = File.new()
	file.open("res://Config/ressources_config.json",file.READ)
	var txt = file.get_as_text()
	file.close()
	return parse_json(txt)
