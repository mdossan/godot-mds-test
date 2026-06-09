class_name MdsTestScene extends Node

signal test_finished()

func test():
	test_finished.emit()
