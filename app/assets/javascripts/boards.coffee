white = "ffffff"

toggleColor = (event) ->
  $target = $(event.target)
  currentColor = tinycolor($target.css('background-color')).toHex()
  if (currentColor == white)
    $(event.target).css('background-color', tinycolor.random())
  else
    $(event.target).css('background-color', '#' + white)

serializeTiles = ->
  colors = $.makeArray($('.tile')).map( (el) ->
    tinycolor($(el).css('background-color')).toHex()
  ).join(',')
  $('#tile_colors').val(colors)

resetBoard = ->
  $('.tile').css('background-color', '#' + white);

ready = ->
  $('.tile').click(toggleColor)
  $('.reset').click(resetBoard)
  $(".edit_board").on("ajax:before", (params) ->
    serializeTiles()
  ).on("ajax:success", (e, data, status, xhr) ->
    $('.tile').click(toggleColor);
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log("ajax:error with error", error, xhr)
  $('.new_board').on('ajax:success', (e, data, status, xhr) ->
    console.log("ajax success for new board")
  )


$(document).ready(ready)
$(document).on('page:load', ready)
