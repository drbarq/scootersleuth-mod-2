
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




function plotMarkers(bird,lime,jump, lat, lng) {
  console.log(bird,lime,jump)
  let map = new google.maps.Map(document.getElementById('map'), {zoom: 16, center: {lat: lat, lng: lng}});
  bird.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Bird"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
  lime.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Lime"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
  jump.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Jump"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
}



// function dropPins(allPoints){
//   var infowindow = new google.maps.InfoWindow();
//   for (var i = 0; i < allPoints.length; i++){
//     var myLatlng = new google.maps.LatLng(allPoints[i].latitude, allPoints[i].longitude);
//     var marker = new google.maps.Marker({
//         position: myLatlng,
//         map: map,
//         animation: google.maps.Animation.DROP
//     });
//     google.maps.event.addListener(marker, 'click', (function(marker, i) {
//     return function() {
//       infowindow.setContent("<ul><li>Latitude " + allPoints[i].latitude + "</li><li>Longitude " + allPoints[i].longitude + "</li></ul>");
//       infowindow.open(map, marker);
//     };
//   })(marker, i));
//   }
// }
