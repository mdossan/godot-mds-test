class_name Assert

static var test_resource: TestResource = preload("res://addons/mds_test/test_resource.tres")

static func assert_is_valid(is_valid: bool, message: String):
	test_resource.record_assertion(is_valid, message)

static func instance_valid(value, message: String):
	assert_is_valid(is_instance_valid(value), message)

static func instance_not_valid(value, message: String):
	assert_is_valid(!is_instance_valid(value), message)

static func is_true(actual: bool, message: String):
	assert_is_valid(actual, message)

static func is_null(actual, message: String):
	assert_is_valid(actual == null, message)

static func is_false(actual: bool, message: String):
	assert_is_valid(not actual, message)

static func equal(actual, value, message: String):
	assert_is_valid(actual == value, message)

static func not_equal(actual, value, message: String):
	assert_is_valid(actual != value, message)

static func less_than(actual, value, message: String):
	assert_is_valid(actual < value, message)

static func less_than_equal(actual, value, message: String):
	assert_is_valid(actual <= value, message)

static func greater_than(actual, value, message: String):
	assert_is_valid(actual > value, message)

static func greater_than_equal(actual, value, message: String):
	assert_is_valid(actual >= value, message)
