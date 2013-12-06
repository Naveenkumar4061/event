$(document).ready(function() {        
/*      var g = $("#event_gallery").portfolio({ 
      enableKeyboardNavigation: true,
      loop: true,
      easingMethod: 'easeOutQuint',
      height: '150px',
      width: '80%',
      lightbox: true,
      showArrows: true          
    });
    g.init();*/
  //$( "#accordian" ).accordion();
  $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
  $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
 
  
});
  
var calculate_total = function(tis){
  var total_no_of_tickets = 0;
  var final_total = 0;
  var tax_total = 0;
  jQuery('.ticket-row').each(function(index){
    p=jQuery(this).find('#dprice').text();
    q=jQuery(this).find('#no_of_tickets').val();
    if(q == 0)
    {
      jQuery(this).find('#total').text('0');
    }else{
      tot = (parseFloat(p) * parseFloat(q));
      tt = parseFloat(jQuery(this).find('#tax_percent').val());
      tax_total += ( tot * tt )/parseFloat('100.0');
      final_total += (tot + ( tot * tt )/parseFloat('100.0'));
      jQuery(this).find('#total').text(tot + ( tot * tt )/parseFloat('100.0'));
      total_no_of_tickets += parseFloat(q);
    }
    
  });
  
  jQuery('#tax_display').text(tax_total);
  jQuery('#total_display').text(final_total);
}


//Maps
function initialize() {
  var lat = $('#latitude').val();
  var lon = $('#longitude').val();
  var tit = $('#markertitle').val();
  var myLatlng = new google.maps.LatLng(parseFloat(lat),parseFloat(lon));
  var mapOptions = {
    zoom: 15,
    center: myLatlng
  };

  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  google.maps.event.trigger(map, "resize");
  
  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: tit
  });
  
}

function myMap() {
  initialize();
  initialize();
}