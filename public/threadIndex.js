$(function(){
  $('.single_thread').on('click', function(event){
    var id = $(event.currentTarget).data('id');
    $.ajax({
      url: "/message_threads/"+id,
      success: function(data){
        // var fcn = JST['templates/threadShow'];
        // var renderedContent = fcn({
          // messages: data[1]
        // });
        // console.log(renderedContent);
        // $('#thread_show').remove();
        // $('body').append(renderedContent);
      }
    })
  })
})