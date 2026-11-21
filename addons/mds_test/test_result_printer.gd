class_name TestResultPrinter

static var test_resource: TestResource = preload("res://addons/mds_test/test_resource.tres")

static func print():
	var total_assertion_count = test_resource.assertion_counter
	var success_assertion_count = test_resource.assertion_success_counter
	var total_test_count = test_resource.total_test_count
	var success_test_count = test_resource.success_test_count
	print("")
	print("============================")
	print("= TESTS RESULTS            =")
	print("============================")
	print("Tests: %d/%d" % [success_test_count, total_test_count])
	print("Assertions: %d/%d" % [success_assertion_count, total_assertion_count])
