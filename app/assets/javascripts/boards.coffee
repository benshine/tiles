white = "ffffff"

toggleColor = (event) ->
  $target = $(event.target)
  currentColor = tinycolor($target.css('background-color')).toHex()
  if (currentColor == white)
    $(event.target).css('background-color', tinycolor.random())
  else
    $(event.target).css('background-color', '#' + white)

beforeEditBoard = ->
  serializeTiles()
  $('input[name=commit]').val('...').prop('disabled', true)

serializeTiles = ->
  colors = $.makeArray($('.tile')).map( (el) ->
    tinycolor($(el).css('background-color')).toHex()
  ).join(',')
  $('#tile_colors').val(colors)

resetBoard = ->
  $('.tile').css('background-color', '#' + white)

showSuccess = (operation) ->
  $('#notice')
    .show()
    .html($('<h6>').text(operation + ' succeeded').addClass('success'))
    .delay(1000)
    .fadeOut(500)
  $('input[name=commit]').val('Update Board').prop('disabled', false)

showError = (operation) ->
  $('#notice')
    .show()
    .html($('<h3>').text(operation + ' failed!').addClass('error'))
  $('input[name=commit]').val('Update Board').prop('disabled', false)

sizeTiles = ->
  rowWidth = $('.container').width()
  boardWidth = $('.board').attr('data-width')
  # Remove a bit for de facto padding caused by line breaks in html
  rowWidth = rowWidth - (10 * boardWidth)
  if (boardWidth == 0)
    boardWidth = 1 # don't divide by zero
  # Tiles look silly when they're huge; clamp them below some max
  tileWidth = Math.min(rowWidth / boardWidth, 75)
  # I don't like that we're adding this to the dom over and over.
  # TODO: write a css rule dynamically.
  # See http://www.javascriptkit.com/dhtmltutors/externalcss3.shtml
  $('.tile').css('width', tileWidth + 'px')
  $('.tile').css('height', tileWidth + 'px')

ready = ->
  sizeTiles()
  $(window).resize(sizeTiles)
  $('.tile').click(toggleColor)
  $('.reset').click(resetBoard)
  $(".edit_board").on("ajax:before", (params) ->
    beforeEditBoard()
  ).on("ajax:success", (e, data, status, xhr) ->
    showSuccess('Save')
    $('.tile').click(toggleColor);
    sizeTiles()
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log("ajax:error with error", error, xhr)
    showError('Edit')
  $('.new_board').on('ajax:success', (e, data, status, xhr) ->
    showSuccess('Creation')
    sizeTiles()
  )


$(document).ready(ready)
$(document).on('page:load', ready)
