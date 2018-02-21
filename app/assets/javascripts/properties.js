var branches = '';
function setMarker(map) {
    if (branches != null && branches.length > 0) {
        branches = branches.replace(/&amp;/g, "&").replace(/&gt;/g, ">").replace(/&lt;/g, "<").replace(/&quot;/g, "\"");
        var branchesList = JSON.parse(branches);

        for (var i = 0; i < branchesList.length; i++) {
            addMarker(map, branchesList[i]);
        }
    }
}

function addMarker(map, branch) {
    var infowindow = new google.maps.InfoWindow();
    var marker = new google.maps.Marker({
        position: {
            lat: branch.Latitude,
            lng: branch.Longitude
        },
        map: map,
        title: branch.branchCode
    });

    var contentString = '<div><strong>' + branch.BranchCode + '</strong><br>' +
        branch.Description + '</div>';

    google.maps.event.addListener(marker, 'click', function () {
        if (contentString == infowindow.getContent()) {
            infowindow.close(map, this);
            infowindow.setContent('');
        }
        else {
            infowindow.setContent(contentString);
            infowindow.open(map, this);
        }
    });
}


function initialize() {
    var mapOptions = {
        center: new google.maps.LatLng(35.460669951495305, 82.44140625), // Initiaize with Riau Islands coordinates
        zoom: 3
    };
    var map = new google.maps.Map(document.getElementById('gmap'), mapOptions);
    setMarker(map);

    google.maps.event.addListener(map, "click", function (e) {

        //lat and lng is available in e object
        var latLng = e.latLng;
        $('#property_map_position').val(latLng);
    });
}

google.maps.event.addDomListener(window, 'load', initialize);


$('.btn').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    var $collapse = $('.advanceSearch');
    $collapse.collapse('toggle');
});


function set_map(lat,lang)  {
    var mapOptions = {
        center: new google.maps.LatLng(lat,lang), // Initiaize with Riau Islands coordinates
        zoom: 12
    };
    var map = new google.maps.Map(document.getElementById('gmap'), mapOptions);
    setMarker(map);
}

