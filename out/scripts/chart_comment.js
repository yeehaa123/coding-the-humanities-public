// select the chart element in the current browser page
var chart = $("#chart");

// get the content from file huygens.json (on the server) 
// and store it in variable content
var content = $.get('./huygens.json');

// the content is the responsetext inside the content variable
// use JSON.parse to get a JavaScript obect and store it
// in variable data
var data = JSON.parse(content.responseText);

// get the list of publishers from the data variable
// and store it in variable publishers
var publishers = data.publishers;

// loop through all the publishers with forEach
// temporarily store each publisher in variable item
// and append a div element to the chart with the
// name of the publisher as text and the book count
// as the width of the div element
publishers.forEach(function(item) { chart.append('<div style="background-color: #268bd2; width:' + item.book_count * 10 + '">' + item.publisher + '</div>'); });

