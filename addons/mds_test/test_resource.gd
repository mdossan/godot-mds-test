class_name TestResource extends Resource

var assertion_counter: int = 0
var assertion_success_counter: int = 0
var assertion_fail_counter: int = 0

var total_test_count: int = 0
var success_test_count: int = 0

func record_assertion(is_ok: bool, message: String):
	var status = "OK"
	if not is_ok:
		status = "ERROR"
	print("[%s] %s" % [status, message])
	assertion_counter += 1
	if is_ok:
		assertion_success_counter += 1
	else:
		assertion_fail_counter += 1
		push_error(message)
