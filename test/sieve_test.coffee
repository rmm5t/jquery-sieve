$ = jQuery

# ======== A Handy Little QUnit Reference ========
# http://api.qunitjs.com/
#
# Test methods:
#   module(name, {[setup][ ,teardown]})
#   test(name, callback)
#   expect(numberOfAssertions)
#   stop(increment)
#   start(decrement)
# Test assertions:
#   ok(value, [message])
#   equal(actual, expected, [message])
#   notEqual(actual, expected, [message])
#   deepEqual(actual, expected, [message])
#   notDeepEqual(actual, expected, [message])
#   strictEqual(actual, expected, [message])
#   notStrictEqual(actual, expected, [message])
#   throws(block, [expected], [message])

module 'jQuery#sieve', setup: ->
  # noop

test 'should be chainable', ->
  expect(1)
  elements = $('#qunit-fixture')
  strictEqual(elements.sieve(), elements, 'return value should equal caller')
