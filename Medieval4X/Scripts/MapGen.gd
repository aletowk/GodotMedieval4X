extends Node2D
				

#func _process(delta):	
#	if(Input.is_action_pressed("left_click")):
#		var mousePos = get_global_mouse_position()
#		mousePos.x /= $TileMap.cell_size.x
#		mousePos.y /= $TileMap.cell_size.y 
#		var tile = $TileMap.get_tile(int(mousePos.x),int(mousePos.y))
#		if(tile != null):
#			print("Tile at : ",Vector2(int(mousePos.x),int(mousePos.y)))
#			print(tile.get_description_str())
#			$GameManager._player.add_tile(tile)
		
var update = false

func _input(event):
	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			update = true
			if(event.button_index == BUTTON_LEFT):
				var mousePos = get_global_mouse_position()
				mousePos.x /= $TileMap.cell_size.x
				mousePos.y /= $TileMap.cell_size.y 
				var tile = $TileMap.get_tile(int(mousePos.x),int(mousePos.y))
				if(tile != null and update == true):
					print("Tile at : ",Vector2(int(mousePos.x),int(mousePos.y)))
					print(tile.get_description_str())
					$GameManager._player.add_tile(tile)
		else:
			update = false
