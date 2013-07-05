$(function(){
    var heightMultiplier = parseInt($('div.container').data('height'));
    var height = heightMultiplier * 200;
    $('div.container').css("height",  height+"px");
    $('.container').sortable({revert: true});
    
    $('div.place_box').on('dblclick', function(event){
      window.location.replace("/places/" + $(event.currentTarget).data('id'))
    })
    
  });