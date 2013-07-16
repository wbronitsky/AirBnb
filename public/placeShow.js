$(function(){
    var id = $('.form_on_page').data('id');
    var formHTML = $('#request_form').html();

    $('#request_form').on('submit', function(event){
      event.preventDefault();
      var request = $('#request_form').serializeJSON();
      
      
      $('.form_on_page').append('<h2>Processing Request</h2>');
      
      $.ajax("http://localhost:3000/places/"+id+"/place_rental_requests",
      { type: 'POST',
        data: request,
        
        success: function(){
          $('.form_on_page').empty();
          $('.form_on_page').append('<h2>Request Submitted!</h2>')
        },
        
        error: function(){
          $('.form_on_page').append('<h3>Dates Already Taken</h3>');
        }
      })
    })

    $('#payment_period').on('change', function(event){
      $('#price').empty();
      var val = $(event.target).val();
      var currentPrice = $(event.target).data(""+val);
      $('#price').html("<h3>$"+currentPrice+"</h3>");
    });

    $('#tabs').tabs();
  })