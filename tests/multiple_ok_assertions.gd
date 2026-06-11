extends MdsTestScene

func test():
	assert_eq(true, true, "should be equal to true")
	assert_eq(42, 42, "should be equal to 42")
	assert_eq("hello", "hello", "should be equal to 'hello'")
