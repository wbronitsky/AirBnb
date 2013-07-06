$(function(){
  $('#send').on('click', function(event){
    var id = $(event.currentTarget).data('id');
    var messageFormData = $('form#reply_form_'+ id).serializeJSON();
    console.log(messageFormData);
    $.ajax({
      url: "/messages",
      type: "post",
      data: messageFormData,
      success: function(data){
        var fcn = JST['templates/singleMessage'];
        var renderedContent = fcn({
          message: data
        });
        $('.all_messages').prepend(renderedContent);
        $('h2#thread_title').empty().text('Thread: ' + data.message.message.split(20)+ '...')
        },
        error: function(){
          $('.all_messages').append("<h5>Message Not Sent</h5>");
        }
      })
    })

    $('#remove').on('click', function(){
      $('#thread_show').remove();
      $('div.single_thread').css('background-color', '#ECF0F1');
    });
})
