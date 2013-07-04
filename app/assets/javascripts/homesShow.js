$( function(){

  var $div = $("<div class='tooltip wrapper_div'></div>");
  var $arrow = $("<div class='tooltip tooltip-arrow'></div>");
  var $beginDateBox = $("<div class='tooltip-inner'></div>");

  $div.append($arrow);
  $div.append($beginDateBox);

  $("#search_begin").on('mouseover', function(event){
  $div.find('.tooltip-inner').text('Check In')
  $('div.search_date_begin').append($div);
  });

  $("#search_begin").on("mouseout", function(event){
  $('div.wrapper_div').remove();
  });

  $("#search_end").on('mouseover', function(event){
  $div.find('.tooltip-inner').text('Check Out')
  $('div.search_date_end').append($div);
  });

  $("#search_end").on("mouseout", function(event){
  $('div.wrapper_div').remove();
  });

});