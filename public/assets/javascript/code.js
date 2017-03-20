var liNodes = document.querySelectorAll('.amendments ul.list-group li');
var inputText = document.getElementById("searchBox");

(function(){
  var d = new Date().getFullYear();
  document.getElementById("date").innerHTML = "© POLYVERGE "+d;
})();

function Amendments(elementNodes, searchText) {
  this.textNodes = elementNodes;
  this.searchText = searchText.toLowerCase();
}

Amendments.prototype.filterAmendments = function(){
  let regex = new RegExp(this.searchText);

  let list = document.getElementsByClassName('amendments');
  console.log(list);
  let result = [];

  for(let i=0; i < this.textNodes.length; i++){
    let counter = i+1;
    let textNode = this.textNodes[i].innerHTML;
    let cleanTextNode = textNode.replace(/;/g, " ").toLowerCase();

    if(regex.test(cleanTextNode)){
       result.push('<span class="number">' + counter +'</span>' +
       '<ul class="list-group"><li class="list-group-item">'+ textNode + "</li></ul>");
    }
  }
  list[0].innerHTML = result;
}

// If there is something to return start the eventListener
window.onload = function runCode(){
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
