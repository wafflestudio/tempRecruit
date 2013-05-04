$ ->

  count = $("div.applicationForm").length

  controller = new ApplicantFormController(count)

  # Put the form back toCenter if the window is resized
  rtime = null
  resizeEnd = =>
    controller.currentForm().toCenter()

  $(window).resize ->
      window.clearTimeout(rtime) if rtime
      rtime = setTimeout(resizeEnd, 200)


  $("input[type=submit]").click((e) =>
    e.preventDefault()
    $.ajax({
      type: "POST"
      data:
        content: $(this).closest("form").find("input[name=content]").val()
        dataType: "json"
        url: $(this).closest("form").attr("action")
        success: $(".nextField").trigger("click")
    }))
