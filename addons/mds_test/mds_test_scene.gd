class_name MdsTestScene extends Node

signal test_finished(result: MdsTestEnums.Result, message: String)

func succeed(message: String = "Test executed with no error"):
	test_finished.emit(MdsTestEnums.Result.SUCCESS, message)

func fail(message: String = "Test has failed"):
	test_finished.emit(MdsTestEnums.Result.FAILURE, message)

func test():
	test_finished.emit(MdsTestEnums.Result.FAILURE, "No test function declared")

func wait_physics_frame():
	await get_tree().physics_frame

func wait_physics_frames(number: int):
	for i in range(number):
		await get_tree().physics_frame

