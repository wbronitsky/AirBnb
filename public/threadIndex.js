$(function(){
  $('.single_thread').on('click', function(event){

    $('div.single_thread').css('background-color', '#ECF0F1');
    $(event.currentTarget).css('background-color', '#BDC3C7');
    
    var currentUserId = $('#currentUserId').data('id');
    var id = $(event.currentTarget).data('id');
    
    $.ajax({
      url: "/message_threads/"+id,
      success: function(data){
        var fcn = JST['templates/threadShow'];
        var renderedContent = fcn({
          thread: data[0],
          messages: data[1],
          currentUserId: currentUserId
        });
        $('div#thread_show').empty();
        $('h2').prepend(renderedContent);
      }
    })
  })
})