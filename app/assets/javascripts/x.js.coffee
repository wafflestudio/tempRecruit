class ApplicantForm extends Movable
  constructor: (@id = id) ->
    super()
    @element = $("#questionField_#{id}")

  toCenter: ->
    x = ($(window).width() - @w) / 2
    y = ($(window).height() - @h) / 2

    @element.show()
    @txy(x, y)

  getLost: ->
    x = Math.floor(Math.random() * $(window).width())
    y = $(window).height() + 100

    callback = => @element.hide()
    @txy(x, y, 300, callback)

class window.ApplicantFormController
  constructor: (@max) ->
    @currentFormIndex = 0
    @max = @max - 1
    @forms = [0..@max].map((i) -> new ApplicantForm(i))
    (form.getLost() if form.id isnt 0) for form in @forms

    @forms[0].toCenter()

    $(".nextField").on("click", @nextForm)
    $(".prevField").on("click", @prevForm)
      
  nextForm: =>
    return if @currentFormIndex > @max - 1
    @forms[@currentFormIndex++].getLost()
    @forms[@currentFormIndex].toCenter()

  prevForm: =>
    return unless @currentFormIndex > 0
    @forms[@currentFormIndex--].getLost()
    @forms[@currentFormIndex].toCenter()

  currentForm: ->
    @forms[@currentFormIndex]
