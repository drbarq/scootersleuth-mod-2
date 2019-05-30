
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// function all_scooters(array){
//   array.map(scooter => scooterlocations(scooter.latitude, scooter.longitude))
// }


// function scooterlocations(){
//   map = new google.maps.Map(document.getElementById('map'), {
//        zoom: 20,
//        center: {lat: 39, lng: -98}
//      });
// }
//
// function plotMarkers(array,bird,lime,jump) {
//   console.log(array,bird,lime,jump)
//   var myCoords = new google.maps.LatLng(array[0],array[1]);
//        var mapOptions = {
//        center: myCoords,
//        zoom: 14
//    };
//   let map = new google.maps.Map(document.getElementById('map'), mapOptions);
//
// function plotMarkers(array,bird,lime,jump) {
//   console.log(array,bird,lime,jump)
//    array.forEach((coord) => {
//      var myCoords = new google.maps.LatLng(array[0], array[1]);
//      var mapOptions = {center: myCoords, zoom:14};
//      let map = new google.maps.Map(document.getElementById('map'), mapOptions);
//    })



function plotMarkers(bird,lime,jump) {
  console.log(bird,lime,jump)
  //initMap(array)
  let map = new google.maps.Map(document.getElementById('map'), {zoom: 12, center: {lat:39.7392, lng: -104.9903}});
  bird.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "bird"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
  })
  lime.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "bird"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
  })
  jump.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "bird"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, animation: google.maps.Animation.DROP});
  })
}

// function initMap(array) {
//     var myCoords = new google.maps.LatLng(array[0], array[1]);
//     var mapOptions = {
//     center: myCoords,
//     zoom: 14
//     };
//     var map = new google.maps.Map(document.getElementById('map'), mapOptions);
//
//     var marker = new google.maps.Marker({
//         position: myCoords,
//         map: map
//     });
// }


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
