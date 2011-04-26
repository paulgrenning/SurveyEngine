var originalQuestions = new Array();

$(document).ready( function(){

  var maxQuestions = parseInt($("#maxQuestion").attr("number"));
  for(i = 0; i < maxQuestions-1; i++){
    originalQuestions.push($("#textArea"+i).attr("value"));
  }
  originalQuestions.push("");

  $(".updateButton").mousedown(function (){
    var indexVal = $(this).attr("number");
    var textAreaValue = $("#textArea"+indexVal).attr("value");
    var hrefVal = $(this).attr("href");
    hrefVal = hrefVal + "&content=" + textAreaValue;
    $(this).attr("href", hrefVal);
  });

  $(".submitQuestion").live('keyup', function (){
    var indexVal = $(this).attr("number");
    var textAreaValue = $("#textArea"+indexVal).attr("value");
    if(textAreaValue == originalQuestions[indexVal]){
      $("#modified"+indexVal).fadeOut('slow', function(){});
    } else {
      $("#modified"+indexVal).fadeIn('slow', function(){});
    }
  });
});
