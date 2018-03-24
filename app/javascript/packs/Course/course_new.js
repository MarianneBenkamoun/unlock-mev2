    function myFunction() {
      document.getElementById("mydiv").classList.toggle("mystyle");
    }

    (function () {
      $('#datetimepicker1').datetimepicker({locale: 'fr',   allowInputToggle: true
        ,});
    });

    function showFilterItem(){
      if (document.getElementById("thebutton").value == "Réserver maintenant"
        ) { document.getElementById("thebutton").value = "Réserver à cette date";
    }
  else if (document.getElementById("thebutton").value == "Réserver à cette date"
    ) {
    document.getElementById("thebutton").value = "Réserver maintenant";
  document.getElementById("datetimepicker1").value = "";
}
}
