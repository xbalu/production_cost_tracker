function DependentAutocompleteInput(selector_1, selector_2) {
  var primary = $(selector_1);
  var secondary = $(selector_2);
  var basePath = secondary.data('endpoint');

  this.run = function() {
    $(document).ready(function() {
      var init_selection = secondary.select2('data');

      update_secondary_input();
      secondary.select2('data', init_selection);
    });

    primary.on('change', function() {
      update_secondary_input();
    });
  }

  function update_secondary_input() {
    var primaryId = primary.val();

    secondary.prop('value', null);

    if (primaryId) {
      var source = basePath.replace('%7Bvalue%7D', primaryId);

      secondary.data('endpoint', source);
      secondary.prop('readonly', false);
    } else {
      secondary.prop('readonly', true);
    }

    new Autocomplete(selector_2).run();
  }
}
