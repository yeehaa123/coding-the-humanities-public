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
// and store it in a jQuery variable $publishers
var $publishers = $(data.publishers);

// loop through all the publishers with forEach
// temporarily store each publisher in variable item
// and append a div element to the chart with the
// name of the publisher as text and the book count
// as a data attribute
$publishers.each(function(i, item) { chart.append('<div data-count=' + item.book_count + '>' + item.publisher + '</div>'); });

// loop through the div elements and adjust the width 
// based on the book count
$('#chart div').each(function(i, el) { $(el).width($(el).data('count') * 30)})


