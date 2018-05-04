var Autocomplete = function(element) {
  this.element = element;
  var self = this;

  this.run = function() {
    $(self.element).select2({
      theme: 'bootstrap',
      placeholder: '---',
      allowClear: true,
      ajax: {
        url: $(self.element).data('endpoint'),
        data: function (term, page) {
          return {
            query: term
          };
        },
        delay: 250,
        results: function (data) {
          return {
            results: data
          };
        },
        cache: true
      },
      initSelection: function(caller, callback) {
        return callback($(caller).data('selection'));
      }
    });
  }
}

$(document).ready(function() {
  $('.select2-autocomplete').each(function(index, element) {
    new Autocomplete(element).run();
  })
});
