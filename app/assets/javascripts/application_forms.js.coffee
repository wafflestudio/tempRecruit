# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  
  stageElm = $("div.stage")
  stage = new Movable
  stage.element = stageElm
  stageElmHeight = stage.y

  moveNext = ->
    stageElmHeight -= 300
    stage.txy(0, stageElmHeight)

  movePrev = ->
    stageElmHeight += 300
    stage.txy(0, stageElmHeight)


  # Attach functions to the onClick events of the buttons
  $(".nextField").on("click", moveNext)
  $(".prevField").on("click", movePrev)



