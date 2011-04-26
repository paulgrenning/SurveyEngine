$(document).ready( function(){
  $(".radiobutton").mouseup(function (){
    var setNumber = $(this).attr("set");
    for(i = 1; i < 6; i++){
      $("#radioset"+setNumber+"index"+i).css("border-color", "#444"); 
      $("#radioset"+setNumber+"index"+i).css("background-color", "#fff"); 
      $("#radioset"+setNumber+"index"+i).attr("selected", "0"); 
    }
    $(this).attr("selected", "1");
    $(this).css("border-color", "#CF9020");
    $(this).css("background-color", "#DBBC5D");
    /*
    $(this).css("border-color", "#006666");
    $(this).css("background-color", "#669999");
    */
  });

  $(".radiobutton").hover(function (){
    if($(this).attr("selected") == "0"){
      $(this).css("border-color", "#669900");
      $(this).css("background-color", "#99CC66");
    }
  });

  $(".radiobutton").mouseout(function (){
    if($(this).attr("selected") == "0"){
      $(this).css("border-color", "#444");
      $(this).css("background-color", "#fff");
    }
  });
});
