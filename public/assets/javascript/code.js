var liNodes = document.querySelectorAll('ul.amendments li');
// var searchText =

function Amendments(elementNodes, searchText) {
  this.textNodes = elementNodes;
}

//  filter function
function checkSearchText(text){
    return text === textNodeWord;
}

Amendments.prototype.filterAmendments = function(){
  for(let i=0; i < this.textNodes.length; i++){
    var textNode = this.textNodes[i].innerHTML;
    console.log(textNode);
  }
}

// create a new instance of the amendments constructor
var filteredAmendments = new Amendments(liNodes);

// call the prototype function on the constructor instance
filteredAmendments.filterAmendments();
