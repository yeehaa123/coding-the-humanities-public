$(document).ready ->
  $.get "./test.json", (data) ->
    $data = $(data)
    $chart = $('.chart')
    $data.each (i, item) ->
      $chart.append("<div data-difficulty='level#{item.difficulty_level}' data-count='#{item.resourceCount}'>#{item.name}</div>")
    $chart.find('div').each (i, el) ->
      width = $(el).data('count') * 100
      $(el).width(width) 
