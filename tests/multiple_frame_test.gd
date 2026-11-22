extends TestScene

func test():
	await wait_physics_frame()
	Assert.equal(true, true, "Frame 1 test")
	await wait_physics_frame()
	Assert.equal(42, 42, "Frame 2 test")
	await wait_physics_frame()
	Assert.equal("foo", "foo", "Frame 3 test")
