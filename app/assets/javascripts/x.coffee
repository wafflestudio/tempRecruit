class ApplicantForm extends Movable
  constructor: (element) ->
    super()
    @element = element

  toCenter: ->
    x = ($(window).width() - @w) / 2
    y = ($(window).height() - @h) / 2

    @txy(x, y)

  getLost: ->
    x = Math.floor(Math.random() * $(window).width())
    y = $(window).height() + 100

    @txy(x, y)

class window.ApplicantFormController
  constructor: ->
    @currentForm = 0
    @max = 4
    @forms = [0..4].map((i) -> new ApplicantForm($("##{i}")))
    form.getLost() for form in @forms

    @forms[0].toCenter()

    $(".nextField").on("click", @nextForm)
    $(".prevField").on("click", @prevForm)
      
  nextForm: =>
    console.log(@currentForm)
    return if @currentForm > @max - 1
    @forms[@currentForm++].getLost()
    @forms[@currentForm].toCenter()

  prevForm: =>
    return unless @currentForm > 0
    @forms[@currentForm--].getLost()
    @forms[@currentForm].toCenter()
