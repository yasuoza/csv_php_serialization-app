jQuery ($)->
  $contents = $('#contents')

  $('#fileupload').fileupload
    dataType: 'json'
    dropZone: $('#drop-zone')

    add: (e, data)->
      e.preventDefault()
      filename = data.files[0].name

      unless filename.match(/\.csv$/)
        (flash = $(".flash-container .alert-error"))
          .fadeIn()
          .click -> $(this).fadeOut()
        setTimeout (-> flash.fadeOut()), 3000
        return

      $('#progress, #serialized-text, #copy-serialized').hide()
      $('#serialized-text').text('')
      $('#upload-btn, #filename').show()
      $('#progress .bar').css('width', "0%")

      data.context = $('#upload-btn')
        .unbind('click')
        .click ->
          $(this).hide()
          data.submit()
      $('#filename').text(filename)

    submit: (e, data)->
      $('#progress').show()

    progress: (e, data)->
      progress = parseInt(data.loaded / data.total * 100,  10)
      $('#progress .bar').css('width', "#{progress}%")

    done: (e, data)->
      console.log data.result.serializedText

      $('#serialized-text').text(data.result.serializedText)
        .focus()
        .select()
      $('#serialized-text, #copy-serialized').show()
      $('#copy-serialized').zclip
        path: '/vendor/ZeroClipboard.swf'
        copy: $('#serialized-text').text()
        afterCopy: ->
          (flash = $(".flash-container .alert-info"))
            .fadeIn()
            .click -> $(this).fadeOut()
          setTimeout (-> flash.fadeOut()), 3000

