---@meta

--- Describe a test suite
--- @param name string The name of the test suite
--- @param func function The test suite function
function describe(name, func) end

--- Define a test case
--- @param name string The name of the test case
--- @param func function The test case function
function it(name, func) end

--- Assert that a condition is true
---@param condition boolean The condition to test
---@param message string The message to display on failure
function assert.is_true(condition, message) end

--- Assert that a condition is false
---@param condition boolean The condition to test
---@param message string The message to display on failure
function assert.is_false(condition, message) end

--- Assert that a value is nil
---@param value any The value to test
---@param message string The message to display on failure
function assert.is_nil(value, message) end

--- Assert that a value is not nil
---@param value any The value to test
---@param message string The message to display on failure
function assert.is_not_nil(value, message) end

--- Assert that two values are equal
---@param expected any The expected value
---@param actual any The actual value
---@param message string The message to display on failure
function assert.are_equal(expected, actual, message) end

--- Assert that two values are not equal
---@param unexpected any The value that should not be equal
---@param actual any The actual value
---@param message string The message to display on failure
function assert.are_not_equal(unexpected, actual, message) end

--- Assert that a table contains a value
---@param table table The table to check
---@param value any The value to check for
---@param message string The message to display on failure
function assert.contains(table, value, message) end

--- Assert that a table does not contain a value
---@param table table The table to check
---@param value any The value to check for
---@param message string The message to display on failure
function assert.not_contains(table, value, message) end

--- Assert that two tables are the same
---@param expected table The expected table
---@param actual table The actual table
---@param message string The message to display on failure
function assert.are_same(expected, actual, message) end

--- Assert that two tables are not the same
---@param unexpected table The table that should not be the same
---@param actual table The actual table
---@param message string The message to display on failure
function assert.are_not_same(unexpected, actual, message) end

--- Assert that a function throws an error
---@param func function The function to call
---@param message string The message to display on failure
function assert.has_error(func, message) end

--- Assert that a function does not throw an error
---@param func function The function to call
---@param message string The message to display on failure
function assert.has_no_error(func, message) end

--- Describe a test suite
---@param name string The name of the test suite
---@param func function The test suite function
function describe(name, func) end

--- Define a test case
---@param name string The name of the test case
---@param func function The test case function
function it(name, func) end

--- Setup function to be run before each test case
---@param func function The setup function
function before_each(func) end

--- Teardown function to be run after each test case
---@param func function The teardown function
function after_each(func) end

--- Setup function to be run once before the test suite
---@param func function The setup function
function setup(func) end

--- Teardown function to be run once after the test suite
---@param func function The teardown function
function teardown(func) end

--- Pending test case
---@param name string The name of the pending test case
function pending(name) end
