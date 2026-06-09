class_name MdsTestRunner extends Node

@export var tests_folder_path: String = "res://tests"

func find_tests(current_path: String, test_paths: Array[String]) -> void:
	var filenames = DirAccess.get_files_at(current_path)
	for filename in filenames:
		if filename.ends_with(".tscn"):
			test_paths.append(current_path + "/" + filename)

	var dirnames = DirAccess.get_directories_at(current_path)
	for dirname in dirnames:
		find_tests(current_path + "/" + dirname, test_paths)
