$(document).ready( function(){
  growBars();
});

function growBars(){
  var numberOfRows = parseInt($("#totalRows").attr("value")) + 1;  
  for(i = 1; i < numberOfRows; i++){
    var newWidthValue = parseInt($("#bar"+i).attr("value"));
    $("#bar"+i).animate({"width": newWidthValue}, 2100);
  }
}
