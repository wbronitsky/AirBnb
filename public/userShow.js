$(function(){
    var heightMultiplier = parseInt($('div.container').data('height'));
    var height = heightMultiplier * 200;
    $('div.container').css("height",  height+"px");
    $('.container').sortable({revert: true});
    $('div.place_box').on('dblclick', function(event){
      window.location.replace("http://localhost:3000/places/" + $(event.currentTarget).data('id'))
    })
    $('div.create_new_place').on('dblclick', function(event){
      window.location.replace("http://localhost:3000/places/new");
    });
  });