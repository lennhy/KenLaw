function Amendments(elementNodes, searchText) {
  this.textNodes = elementNodes;
  this.searchText = searchText.toLowerCase();
}

Amendments.prototype.filterAmendments = function(){
  let regex = new RegExp(this.searchText);

  let list = document.getElementsByClassName('amendments');

  let result = [];

  for(let i=0; i < this.textNodes.length; i++){
    let textNode = this.textNodes[i].innerHTML;
    let cleanTextNode = textNode.replace(/;/g, " ").toLowerCase();

    if(regex.test(cleanTextNode)){
       result.push("<li>"+ textNode + "</li>");
    }
  }
  list[0].innerHTML = result;
}

// If there is something to return start the eventListener
window.onload = function runCode(){
  var liNodes = document.querySelectorAll('ol.amendments li');
  var inputText = document.getElementById("searchBox");

  if (inputText !== null) {
    // Dynamically update the DOM or console every time user enters a key
    inputText.addEventListener('keyup', function() {
      // save value that user types in search box
      var search = inputText.value;
      // create a new instance of the amendments constructor
      var filteredAmendments = new Amendments(liNodes, search);
       filteredAmendments.filterAmendments();
    }, false);
  }
}

// Make the message above navbar fades out after it appears
$(document).ready(function(){

      if($(".error")){
        $(".error").delay(3000).slideUp();
      }
      if($(".message")){
        $(".message").delay(3000).slideUp();
      }
      if($(".notice")){
        $(".notice").delay(3000).slideUp();
      }
      if($(".alert")){
        $(".alert").delay(3000).slideUp();
      }
});
