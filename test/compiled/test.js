(function() {
  var $;

  $ = jQuery;

  module('jQuery#sieve', {
    setup: function() {}
  });

  test('should be chainable', function() {
    var elements;
    expect(1);
    elements = $('#qunit-fixture');
    return strictEqual(elements.sieve(), elements, 'return value should equal caller');
  });

}).call(this);
