$(document).ready(function() {
  $('.select2-autocomplete').each(function(index, element) {
    $(element).select2({
      theme: 'bootstrap',
      placeholder: '---',
      allowClear: true,
      ajax: {
        url: $(element).data('endpoint'),
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
  })
});
