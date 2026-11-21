class_name TestSceneLoader

static func load(test_path: String, destination_node: Node) -> TestScene:
	print("============================")
	print("Loading test: %s" % test_path)
	var test_resource: PackedScene = load(test_path)
	var test_scene: TestScene = test_resource.instantiate()
	destination_node.add_child(test_scene)
	return test_scene
