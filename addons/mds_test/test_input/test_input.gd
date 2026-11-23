class_name TestInput

func press(action: String) -> void:
	var ev = InputEventAction.new()
	ev.action = action
	ev.pressed = true
	Input.parse_input_event(ev)
	Input.flush_buffered_events()

func release(action: String) -> void:
	var ev = InputEventAction.new()
	ev.action = action
	ev.pressed = false
	Input.parse_input_event(ev)
	Input.flush_buffered_events()

func move_mouse_relative(relative_x: int, relative_y: int) -> void:
	var event: InputEventMouseMotion = InputEventMouseMotion.new()
	event.relative.x = relative_x
	event.relative.y = relative_y
	Input.parse_input_event(event)
	Input.flush_buffered_events()

func move_mouse_global(relative_x: int, relative_y: int) -> void:
	var event: InputEventMouseMotion = InputEventMouseMotion.new()
	event.global_position.x = relative_x
	event.global_position.y = relative_y
	Input.parse_input_event(event)
	Input.flush_buffered_events()

func move_mouse_interpolate(p1: Vector2, p2: Vector2, steps: int) -> void:
	for i in range(steps):
		var event: InputEventMouseMotion = InputEventMouseMotion.new()
		event.position.x = lerp(p1.x, p2.x, float(i) / float(steps))
		event.position.y = lerp(p1.y, p2.y, float(i) / float(steps))
		Input.parse_input_event(event)
		Input.flush_buffered_events()

func mouse_click(
	x: float,
	y: float,
	pressed: bool = true,
	button_index: MouseButton = MouseButton.MOUSE_BUTTON_LEFT
) -> void:
	var event: InputEventMouseButton = InputEventMouseButton.new()
	event.position.x = x
	event.position.y = y
	event.pressed = pressed
	event.button_index = button_index
	Input.parse_input_event(event)
	Input.flush_buffered_events()
