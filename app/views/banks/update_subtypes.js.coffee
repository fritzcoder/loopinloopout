$('#sub_type').empty()
$('<%= escape_javascript(options_for_select(@t)) %>')
  .appendTo('#sub_type')
