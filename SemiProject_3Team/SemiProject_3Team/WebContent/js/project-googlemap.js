onload = function(){
	var map;
	
	    function initMap() {
	      const mapOptions = {
	        zoom: 15,
	        center:  { lat: googlemap_lat, lng: googlemap_lng},
	        disableDefaultUI:true,
	        zoomControl: true
	      };
	      map = new google.maps.Map(document.getElementById("map"), mapOptions);
	      
	      const marker = new google.maps.Marker({
	        position: { lat: googlemap_lat, lng: googlemap_lng },
	        map: map,
	      });
	      
	      google.maps.event.addListener(marker, "click", () => {
	        infowindow.open(map, marker);
	      });
	    }	
}