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
  $('.tile').css('background-color', '#' + white)

showSuccess = (operation) ->
  $('#messages')
    .show()
    .html($('<div>').text(operation + ' was sucessful!'))
    .delay(1000)
    .fadeOut(500)

showError = (operation) ->
  $('#messages')
    .show()
    .html($('<div>').text(operation + ' failed!'))
    .delay(1000)
    .fadeOut(500)


ready = ->
  $('.tile').click(toggleColor)
  $('.reset').click(resetBoard)
  $(".edit_board").on("ajax:before", (params) ->
    serializeTiles()
  ).on("ajax:success", (e, data, status, xhr) ->
    showSuccess('Edit')
    $('.tile').click(toggleColor);
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log("ajax:error with error", error, xhr)
    showError('Edit')
  $('.new_board').on('ajax:success', (e, data, status, xhr) ->
    showSuccess('Creation')
    console.log("ajax success for new board")
  )


$(document).ready(ready)
$(document).on('page:load', ready)
