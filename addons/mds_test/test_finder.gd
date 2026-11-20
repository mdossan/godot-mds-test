class_name TestFinder

static var test_resource: TestResource = preload("res://addons/mds_test/test_resource.tres")

static func find(current_path: String) -> Array[String]:
	var test_paths = _find_recur(current_path)
	print("Running %d Tests" % test_paths.size())
	test_resource.total_test_count = test_paths.size()
	return test_paths

static func _find_recur(current_path: String, test_paths: Array[String] = []) -> Array[String]:
	var filenames = DirAccess.get_files_at(current_path)

	for filename in filenames:
		if filename.ends_with(".tscn"):
			test_paths.append(current_path + "/" + filename)

	var dirnames = DirAccess.get_directories_at(current_path)
	for dirname in dirnames:
		_find_recur(current_path + "/" + dirname, test_paths)

	return test_paths
