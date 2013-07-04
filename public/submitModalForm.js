$(function(){
  $('#send').on('click', function(){
    var messageFormData = $('.message_send_forms').serializeJSON();
    $.ajax({
      url: "/messages",
      type: "post",
      data: messageFormData,
      success: function(){
        console.log('yup');
        $('.request').append("<h5>Message Sent</h5>");
      },
      error: function(){
        console.log('nope');
        $('.request').append("<h5>Message Not Sent</h5>");
      }
    })
  })
})
