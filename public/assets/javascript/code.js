var liNodes = document.querySelectorAll('ol.amendments li');
var inputText = document.getElementById("searchBox");
var search = "";


function Amendments(elementNodes, searchText) {
  this.textNodes = elementNodes;
  this.searchText = searchText;
}

Amendments.prototype.filterAmendments = function(){
  var regex = new RegExp(this.searchText);
  console.log(regex);

  for(let i=0; i < this.textNodes.length; i++){
    var textNode = this.textNodes[i].innerHTML;
    cleanTextNode = textNode.replace(/;/g, " ");
    if(regex.test(cleanTextNode)){
      console.log(textNode);
    }
  }
  
}

// Dynamically update the DOM or console every time user enters a key
inputText.addEventListener('keyup', function() {
  // save value that user types in search box
  search = inputText.value;

  // create a new instance of the amendments constructor
  var filteredAmendments = new Amendments(liNodes, search);

   filteredAmendments.filterAmendments();

}, false);
