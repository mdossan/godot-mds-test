class_name MdsTestScene extends Node

signal assertion(is_ok: bool, message: String)

func test() -> void:
	assert_eq(true, false, "No test defined")

func wait_physics_frame():
	await get_tree().physics_frame

func wait_physics_frames(number: int):
	for i in range(number):
		await get_tree().physics_frame

func input_press(action: String) -> void:
	await get_tree().physics_frame
	var ev = InputEventAction.new()
	ev.action = action
	ev.pressed = true
	Input.parse_input_event(ev)
	Input.flush_buffered_events()

func input_mouse(relative_x: int, relative_y: int) -> void:
	await get_tree().physics_frame
	var event: InputEventMouseMotion = InputEventMouseMotion.new()
	event.relative.x = relative_x
	event.relative.y = relative_y
	Input.parse_input_event(event)
	Input.flush_buffered_events()

func assert_is_valid(is_valid: bool, message: String):
	assertion.emit(is_valid, message)

func assert_is_instance_valid(value, message: String):
	assert_is_valid(is_instance_valid(value), message)

func assert_is_not_instance_valid(value, message: String):
	assert_is_valid(!is_instance_valid(value), message)

func assert_true(actual: bool, message: String):
	assert_is_valid(actual, message)

func assert_null(actual, message: String):
	assert_is_valid(actual == null, message)

func assert_false(actual: bool, message: String):
	assert_is_valid(not actual, message)

func assert_eq(actual, value, message: String):
	assert_is_valid(actual == value, message)

func assert_neq(actual, value, message: String):
	assert_is_valid(actual != value, message)

func assert_lt(actual, value, message: String):
	assert_is_valid(actual < value, message)

func assert_gt(actual, value, message: String):
	assert_is_valid(actual > value, message)

func assert_lte(actual, value, message: String):
	assert_is_valid(actual <= value, message)

func assert_gte(actual, value, message: String):
	assert_is_valid(actual >= value, message)
