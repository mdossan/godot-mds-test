class_name TestScene extends Node

var test_resource: TestResource = preload("res://addons/mds_test/test_resource.tres")
var success: bool = true

func _exit_tree() -> void:
	if not success:
		return
	test_resource.success_test_count += 1

func test() -> void:
	Assert.equal(true, false, "No test defined")

func wait_physics_frame():
	await get_tree().physics_frame

func wait_physics_frames(number: int):
	for i in range(number):
		await get_tree().physics_frame
