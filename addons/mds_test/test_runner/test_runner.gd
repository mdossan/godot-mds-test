class_name TestRunner extends Node

@export var tests_folder_path: String = "res://tests"

var test_resource: TestResource = preload("res://addons/mds_test/test_resource.tres")

func _ready() -> void:
	run_tests()
	exit()

func run_tests():
	var test_paths: Array[String] = TestFinder.find(tests_folder_path)

	for test_path in test_paths:
		var test_scene = TestSceneLoader.load(test_path, self)
		await test_scene.test()
		test_scene.queue_free()
		await test_scene.tree_exited

	TestResultPrinter.print()

func exit() -> void:
	await get_tree().create_timer(.2).timeout
	get_tree().quit()
