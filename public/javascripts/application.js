// Generated by CoffeeScript 1.6.2
(function() {
  jQuery(function($) {
    var $contents;

    $contents = $('#contents');
    return $('#fileupload').fileupload({
      dataType: 'json',
      dropZone: $('#drop-zone'),
      add: function(e, data) {
        var filename, flash;

        e.preventDefault();
        filename = data.files[0].name;
        if (!filename.match(/\.csv$/)) {
          (flash = $(".flash-container .alert-error")).fadeIn().click(function() {
            return $(this).fadeOut();
          });
          setTimeout((function() {
            return flash.fadeOut();
          }), 3000);
          return;
        }
        $('#progress, #filename, #upload-btn, #serialized-text, #copy-serialized').remove();
        data.context = $('<button id="upload-btn"/>').text('Upload').addClass('btn btn-primary').appendTo($contents).click(function() {
          data.context = $(this).remove();
          return data.submit();
        });
        return $('<span id="filename"/>').text(filename).appendTo($contents);
      },
      submit: function(e, data) {
        return $('<div id="progress"/>').addClass('progress progress-success progress-striped').append('<div class="bar"/>').appendTo($contents);
      },
      progress: function(e, data) {
        var progress;

        progress = parseInt(data.loaded / data.total * 100, 10);
        return $('#progress .bar').css('width', "" + progress + "%");
      },
      done: function(e, data) {
        $('<textarea id="serialized-text"/>').text(data.result.serializedText).appendTo($contents).focus().select();
        return $('<button id="copy-serialized"/>').text('Copy').addClass('btn btn-info').appendTo($contents).zclip({
          path: '/javascripts/ZeroClipboard.swf',
          copy: $('#serialized-text').text(),
          afterCopy: function() {
            var flash;

            (flash = $(".flash-container .alert-info")).fadeIn().click(function() {
              return $(this).fadeOut();
            });
            return setTimeout((function() {
              return flash.fadeOut();
            }), 3000);
          }
        });
      }
    });
  });

}).call(this);
