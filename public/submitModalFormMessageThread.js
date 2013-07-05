$(function(){
  $('#send').on('click', function(){
    var messageFormData = $('.message_send_forms').serializeJSON();
    $.ajax({
      url: "/messages",
      type: "post",
      data: messageFormData,
      success: function(data){
        console.log('yup');
        var fcn = JST['templates/singleMessage'];
        var renderedContent = fcn({
          message: data
        });
        $('.all_messages').append(renderedContent);
      },
      error: function(){
        console.log('nope');
        $('.all_messages').append("<h5>Message Not Sent</h5>");
      }
    })
  })
})
