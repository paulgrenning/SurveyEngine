var showingAlready = false;

function verifySelection(){
  if(showingAlready == true){
    instantHide2();
    instantShow();
  } else {
    showingAlready = true;
    $("#hiddenYes").fadeIn('slow', function() {});
    $("#hiddenNo").fadeIn('slow', function() {});
  }
}

function verifySelection2(){
  if(showingAlready == true){
    instantHide();
    instantShow2();
  } else {
    showingAlready = true;
    $("#hiddenYes2").fadeIn('slow', function() {});
    $("#hiddenNo2").fadeIn('slow', function() {});
  }
}

function instantShow2(){
  $("#hiddenYes2").css('display', 'block');
  $("#hiddenNo2").css('display', 'block');
}

function instantShow(){
  $("#hiddenYes").css('display', 'block');
  $("#hiddenNo").css('display', 'block');
}

function instantHide(){
  $("#hiddenYes").css('display', 'none');
  $("#hiddenNo").css('display', 'none');
}

function instantHide2(){
  $("#hiddenYes2").css('display', 'none');
  $("#hiddenNo2").css('display', 'none');
}

function hideVerification2(){
  showingAlready = false;
  $("#hiddenYes2").fadeOut('slow', function() {});
  $("#hiddenNo2").fadeOut('slow', function() {});
}

function hideVerification(){
  showingAlready = false;
  $("#hiddenYes").fadeOut('slow', function() {});
  $("#hiddenNo").fadeOut('slow', function() {});
}
