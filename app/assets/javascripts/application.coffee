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

      $('#progress, #filename, #upload-btn, #serialized-text, #copy-serialized').remove()

      data.context = $('<button id="upload-btn"/>').text('Upload')
        .addClass('btn btn-primary')
        .appendTo($contents)
        .click ->
          data.context = $(this).remove()
          data.submit()
      $('<span id="filename"/>').text(filename).appendTo($contents)

    submit: (e, data)->
      $('<div id="progress"/>').addClass('progress progress-success progress-striped')
        .append('<div class="bar"/>')
        .appendTo($contents)

    progress: (e, data)->
      progress = parseInt(data.loaded / data.total * 100,  10)
      $('#progress .bar').css('width', "#{progress}%")

    done: (e, data)->
      $('<textarea id="serialized-text"/>').text(data.result.serializedText)
        .appendTo($contents)
        .focus()
        .select()

      $('<button id="copy-serialized"/>').text('Copy')
        .addClass('btn btn-info')
        .appendTo($contents)
        .zclip
          path: '/javascripts/ZeroClipboard.swf'
          copy: $('#serialized-text').text()
          afterCopy: ->
            (flash = $(".flash-container .alert-info"))
              .fadeIn()
              .click -> $(this).fadeOut()
            setTimeout (-> flash.fadeOut()), 3000

