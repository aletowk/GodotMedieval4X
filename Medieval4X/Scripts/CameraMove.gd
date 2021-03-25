extends Camera2D

export var speed = 50.0

export var zoomspeed = 10.0
export var zoommargin = 0.1
export var zoomMin = 0.25
export var zoomMax = 20


var zoompos = Vector2()
var zoomfactor = 1.0
var zooming = false

func _ready():
	pass

func _process(delta):
	# Smooth Movement
	var inpx = ( int(Input.is_action_pressed("ui_right")) 
				 - int(Input.is_action_pressed("ui_left")))
	var inpy = ( int(Input.is_action_pressed("ui_down")) 
				 - int(Input.is_action_pressed("ui_up")))
	position.x = lerp(position.x,position.x + inpx * speed * zoom.x,speed * delta)
	position.y = lerp(position.y,position.y + inpy * speed * zoom.y,speed * delta)

	# Camera zoom
	zoom.x = lerp(zoom.x,zoom.x * zoomfactor,zoomspeed*delta)
	zoom.y = lerp(zoom.y,zoom.y * zoomfactor,zoomspeed*delta)

	zoom.x = clamp(zoom.x,zoomMin,zoomMax)
	zoom.y = clamp(zoom.y,zoomMin,zoomMax)

	if not zooming:
		zoomfactor = 1.0

func _input(event):
	if(abs(zoompos.x - get_global_mouse_position().x) > zoommargin):
		zoomfactor = 1.0
	if(abs(zoompos.y - get_global_mouse_position().y) > zoommargin):
		zoomfactor = 1.0

	if(event is InputEventMouseButton):
		if(event.is_pressed()):
			zooming = true
			if(event.button_index == BUTTON_WHEEL_UP):
				zoomfactor -= 0.01 * zoomspeed
				zoompos = get_global_mouse_position()
			if(event.button_index == BUTTON_WHEEL_DOWN):
					zoomfactor += 0.01 * zoomspeed
					zoompos = get_global_mouse_position()
		else:
			zooming = false
