$('#sub_type').empty()
$('<%= escape_javascript(options_for_select(@t)) %>')
  .appendTo('#sub_type')

<% if @sound_file_types != nil %>
$('#sub_type').val(<%= @sound_file_types %>);
<% end %>
