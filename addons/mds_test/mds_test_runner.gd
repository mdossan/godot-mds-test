class_name MdsTestRunner extends Node

signal wait_test_end

@export var tests_folder_path: String = "res://tests"

func _ready() -> void:
	run_tests()

func run_tests():
	var test_paths: Array[String] = []
	find_tests(tests_folder_path, test_paths)
	print("Found %d tests" % test_paths.size())
	for test_path in test_paths:
		print("============================")
		print("Running test: %s" % test_path)
		var test_resource: PackedScene = load(test_path)
		var test_scene: MdsTestScene = test_resource.instantiate()
		test_scene.test_finished.connect(_on_test_finished.bind(test_scene))
		test_scene.tree_exited.connect(_on_test_unmounted)
		add_child(test_scene)
		# We wait an initial physics_frame to be sure all area and collision are init
		await get_tree().physics_frame
		test_scene.test()
		await wait_test_end

func find_tests(current_path: String, test_paths: Array[String]) -> void:
	var filenames = DirAccess.get_files_at(current_path)
	for filename in filenames:
		if filename.ends_with(".tscn"):
			test_paths.append(current_path + "/" + filename)

	var dirnames = DirAccess.get_directories_at(current_path)
	for dirname in dirnames:
		find_tests(current_path + "/" + dirname, test_paths)

func _on_test_finished(result: MdsTestEnums.Result, message: String, test_scene: MdsTestScene):
	print("[%s] %s" % [MdsTestEnums.Result.keys()[result], message])
	test_scene.queue_free()

func _on_test_unmounted():
	wait_test_end.emit()
