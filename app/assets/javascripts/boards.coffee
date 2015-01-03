white = "ffffff"

toggleColor = (event) ->
  $target = $(event.target)
  currentColor = tinycolor($target.css('background-color')).toHex()
  if (currentColor == white)
    $(event.target).css('background-color', tinycolor.random())
  else
    $(event.target).css('background-color', '#' + white)

ready = ->
  $('.tile').click(toggleColor);
  $(".edit_board").on("ajax:success", (e, data, status, xhr) ->
    console.log("ajax:success with data", data, xhr)
  ).on "ajax:error", (e, xhr, status, error) ->
    console.log("ajax:error with error", error, xhr)

$(document).ready(ready)
$(document).on('page:load', ready)
