extends MdsTestScene

func test():
	await wait_physics_frame()
	assert_eq(true, true, "Frame 1 test")
	await wait_physics_frame()
	assert_eq(42, 42, "Frame 2 test")
	await wait_physics_frame()
	assert_eq("foo", "foo", "Frame 3 test")
