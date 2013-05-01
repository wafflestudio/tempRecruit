$ ->
  controller = new ApplicantFormController()

  # Put the form back toCenter if the window is resized
  rtime = null
  resizeEnd = =>
    controller.currentForm().toCenter()

  $(window).resize ->
      window.clearTimeout(rtime) if rtime
      rtime = setTimeout(resizeEnd, 200)
