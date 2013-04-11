$('#remix_list').empty()
$('<%= escape_javascript(render :partial => "remix_list", 
	:locals => { :sound_files => @remix_files, :player_size => "small"}) %>')
  .appendTo('#remix_list')
  .hide()
  .fadeIn()