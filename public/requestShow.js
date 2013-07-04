$(function(){
  $('#tabs').tabs();

  $('.rental_request').on('click', function(event){
    console.log(event.currentTarget)
    var id = $(event.currentTarget).data('id');
    var place = $(event.currentTarget).data('place');
    window.location.replace("/places/" + place + "/place_rental_requests/" +id );
  })
});