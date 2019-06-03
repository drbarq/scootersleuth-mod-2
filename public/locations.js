
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function plotMarkers(bird,lime,jump, spin, lat, lng) {
  console.log(bird,lime,jump)
  let map = new google.maps.Map(document.getElementById('map'), {zoom: 16, center: {lat: lat, lng: lng}});
  bird.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Bird"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, icon: 'https://i.imgur.com/vjwfGlu.png', animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
  lime.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Lime"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, icon: 'https://i.imgur.com/IfAWHc6.png', animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
  jump.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Jump"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, icon: 'https://i.imgur.com/2Z46Omm.png', animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
  spin.forEach((coord) => {
    let infowindow = new google.maps.InfoWindow({content: "Spin"});
    let marker = new google.maps.Marker({position: new google.maps.LatLng(coord[0], coord[1]), map: map, icon: 'https://i.imgur.com/8rpLmdm.png', animation: google.maps.Animation.DROP});
    marker.addListener('click', function() {infowindow.open(map, marker)});
  })
}
