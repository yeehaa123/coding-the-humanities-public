(function() {
  $(document).ready(function() {
    return $.get("./test.json", function(data) {
      var $chart, $data;
      $data = $(data);
      $chart = $('.chart');
      $data.each(function(i, item) {
        return $chart.append("<div data-difficulty='level" + item.difficulty_level + "' data-count='" + item.resourceCount + "'>" + item.name + "</div>");
      });
      return $chart.find('div').each(function(i, el) {
        var width;
        width = $(el).data('count') * 100;
        return $(el).width(width);
      });
    });
  });

}).call(this);
