$(function(){
  $('#send').on('click', function(){
    console.log('clicked');
    var messageFormData = $('.message_send_forms').serializeJSON();
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
