$(function(){
    var heightMultiplier = parseInt($('div.container').data('height'));
    var height = heightMultiplier * 200;
    $('div.container').css("height",  height+"px");
    $('.container').sortable({revert: true});
    
    $('div.place_box').on('dblclick', function(event){
      window.location.replace("/places/" + $(event.currentTarget).data('id'))
    })
    
    $('div.create_new_place').on('dblclick', function(event){
      window.location.replace("/places/new");
    });

    $('.cancel_trip').on('click', function(event){
      var id = $(event.target).data('id');
      var placeId = $(event.target).data('place');

      $.ajax({
        url: "/places/"+ placeId +"/place_rental_requests/" +id,
        type: "DELETE",
        success: function(){
          $parentDiv = $($(event.target).parent());
          $parentDiv.empty();
          $parentDiv.html("<h3>Trip Cancelled</h3>");
        },
        error: function(){
          $parentDiv = $($(event.target).parent());
          $parentDiv.append("<p>Cannot Cancel</p>");
        }
      })
    })

    $('#tabs').tabs();
  });