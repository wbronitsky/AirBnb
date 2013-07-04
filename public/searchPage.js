$(function(){
    var address = $('#first_address').data('address');
    address = address + " " +$('#first_address').data('city');
    console.log(address);
    
    
    var mapOptions = {
      center: new google.maps.LatLng(0, 0),
      zoom: 12,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var geocoder = new google.maps.Geocoder();

    geocoder.geocode({address: address}, function(results, status){
     map.setCenter(results[0].geometry.location);
     var marker = new google.maps.Marker({
      position: results[0].geometry.location,
      title: "testing"
     });

     marker.setMap(map);
    })

    $('.place_search_box').on('click', function(event){
        window.location.replace("http://localhost:3000/places/" + $(event.currentTarget).data('id'))
    })
  })