$(function(){
  $('.single_thread').on('click', function(event){
    var id = $(event.currentTarget).data('id');
    window.location.replace('/message_threads/' + id);
  })
})