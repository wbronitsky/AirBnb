$(function(){
    var mapOptions = {
      center: new google.maps.LatLng(0, 0),
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    var allPlaces = $('div.all_places');
    _(allPlaces).each(function(place){
      var $place = $(place);

      var title = $place.data('title')
      var address = $place.data('address');
      address = address + " " +$place.data('city');
      
      var geocoder = new google.maps.Geocoder();

      geocoder.geocode({address: address}, function(results, status){
       map.setCenter(results[0].geometry.location);
       var marker = new google.maps.Marker({
        position: results[0].geometry.location,
        title: title
       });

       marker.setMap(map);

       var url = document.URL;
       google.maps.event.addListener(marker, 'click', function(){
          window.location.replace(url + "#" + title);
        })
      })
    })
  })