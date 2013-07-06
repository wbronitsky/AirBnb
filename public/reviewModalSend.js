$(function(){
  $('#send').on('click', function(event){
    var id = $(event.currentTarget).data('id');
    var messageFormData = $('form.review_forms').serializeJSON();
    console.log(messageFormData);
    $.ajax({
      url: "/reviews",
      type: "post",
      data: messageFormData,
      success: function(data){
        $('#message_button_'+id).parent().append('<h5>Review Submitted</h5>')
        $('#message_button_'+id).remove()
        },
        error: function(){
          $('#message_button_'+id).append("<h5>Review Not Submitted</h5>");
        }
      })
    })
})