var chart = $("#chart");

var content = $.get('./huygens.json');

var data = JSON.parse(content.responseText);

var publishers = data.publishers;

publishers.forEach(function(item) { chart.append('<div style="background-color: #268bd2; width:' + item.book_count * 10 + '">' + item.publisher + '</div>'); });

