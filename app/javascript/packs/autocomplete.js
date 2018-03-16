function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  var options = {
  types: ['address'],
  componentRestrictions: {country: 'fr'}
};

  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, options,{ types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();

  // console.log(place);  // Uncomment this line to view the full object returned by Google API.

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
              if (place.address_components[i].types[j] == "postal_code") {
                  var postalcode = place.address_components[i].long_name;
              if (postalcode != 59800 && postalcode != 59000 && postalcode != 59100 && postalcode != 59200

)
                {document.getElementById("myBtn").disabled = true;}

              else {
    document.getElementById("myBtn").disabled = false;
  }


        }
    }
  }
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('course_sites_attributes_0_address');
  initializeAutocomplete('course_sites_attributes_1_address');
});
