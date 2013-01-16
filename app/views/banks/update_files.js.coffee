$('#file_list').empty()
$('<%= escape_javascript(render :partial => "list_files", 
	:locals => { :sound_files => @sound_files, :user => @user_name, :bank => @bank, :player_size => "small", :modal => @modal}) %>')
  .appendTo('#file_list')
  .hide()
  .fadeIn()