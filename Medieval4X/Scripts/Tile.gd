class_name Tile
const MAX_FISH_ON_OCEAN = 10
const MAX_FISH_ON_WATER = 5

const MAX_FOOD_ON_GRASS = 5
const MAX_WOOD_ON_GRASS = 10

const MAX_FOOD_ON_MOUNTAIN = 1
const MAX_WOOD_ON_MOUNTAIN = 2
const MAX_STONE_ON_MOUNTAIN = 20

var type
var owner_player
var available_ressources

func _init(_type):
	type = _type
	owner_player = "None"
	compute_ressources()

func compute_ressources():
	available_ressources = []
	if(type == "ocean"):
		var amount = randi() %  MAX_FISH_ON_OCEAN
		var fish_ressource = {"type" : "fish", "amount" : amount}
		available_ressources.append(fish_ressource)
	elif (type == "water"):
		var amount = randi() %  MAX_FISH_ON_WATER
		var fish_ressource = {"type" : "fish", "amount" : amount}
		available_ressources.append(fish_ressource)
	elif (type == "sand"):
		pass
	elif (type == "grass"):
		var amount = randi() %  MAX_FOOD_ON_GRASS
		var tmp_ressource = {"type" : "food", "amount" : amount}
		available_ressources.append(tmp_ressource)
	
		amount = randi() %  MAX_WOOD_ON_GRASS
		tmp_ressource = {"type" : "wood", "amount" : amount}
		available_ressources.append(tmp_ressource)
	elif (type == "mountain"):
		var amount = randi() %  MAX_FOOD_ON_GRASS
		var tmp_ressource = {"type" : "food", "amount" : amount}
		available_ressources.append(tmp_ressource)
	
		amount = randi() %  MAX_WOOD_ON_MOUNTAIN
		tmp_ressource = {"type" : "wood", "amount" : amount}
		available_ressources.append(tmp_ressource)

		amount = randi() %  MAX_STONE_ON_MOUNTAIN
		tmp_ressource = {"type" : "stone", "amount" : amount}
		available_ressources.append(tmp_ressource)
		

func get_description_str():
	var s = ""

	s += "Tile type    : " + type + "\n"
	s += "Owner player : " + owner_player + "\n"
	s += "Available Ressources :\n"
	for res in available_ressources:
		s += res.type + " : " + str(res.amount) + "\n"
	return s
