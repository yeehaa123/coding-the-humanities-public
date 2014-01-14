var chart = $("#chart");

var content = $.get('./huygens.json');

var data = JSON.parse(content.responseText);

var $publishers = $(data.publishers);

$publishers.each(function(i, item) { chart.append('<div data-count=' + item.book_count + '>' + item.publisher + '</div>'); });

$('#chart div').each(function(i, el) { $(el).width($(el).data('count') * 30)})


