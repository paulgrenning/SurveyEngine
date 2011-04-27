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
    $("#errorset"+setNumber).fadeOut('slow', function (){}); 
  });

  $(".radiobutton").hover(function (){
    if($(this).attr("selected") == "0"){
      $(this).css("border-color", "#006666");
      $(this).css("background-color", "#669999");
    }
  });

  $(".radiobutton").mouseout(function (){
    if($(this).attr("selected") == "0"){
      $(this).css("border-color", "#444");
      $(this).css("background-color", "#fff");
    }
  });
});

function submitSurveyJS(){
 var numQuestions = parseInt($("#numberOfQuestions").attr("value"));
 var retVal = true;
 var selections = new Array();
 for(i = 0; i < numQuestions; i++){
   for(j = 1; j < 6; j++){
     if($("#radioset"+i+"index"+j).attr("selected") == "1"){
       selections.push(j);
       break; 
     } else if(j == 5){
       retVal = false;
       $("#errorset"+i).fadeIn('slow', function (){}); 
     }
   }  
 }
 if(retVal == true){
   var surveyId = $("#submitSurveyAnswers").attr("surveyid");
   var hrefVal = "/saveresults?id="+surveyId+"&answers="; 
   for(i = 0; i < numQuestions; i++){
     hrefVal = hrefVal + selections[i] + "x";
   } 
   $("#submitSurveyAnswers").attr("href", hrefVal);
 }
 return retVal;
}
