class_name MdsTestScene extends Node

signal test_finished(result: MdsTestEnums.Result, message: String)

func succeed(message: String = "Test executed with no error"):
	test_finished.emit(MdsTestEnums.Result.SUCCESS, message)

func fail(message: String = "Test has failed"):
	test_finished.emit(MdsTestEnums.Result.FAILURE, message)

func test():
	test_finished.emit(MdsTestEnums.Result.FAILURE, "No test function declared")
