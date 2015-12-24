var ls = ls || {};

/**
 * Опросы
 */
ls.topic = (function ($) {

  this.preview = function (form, preview) {
    form = $('#' + form);
    preview = $('#' + preview);
    var url = aRouter['ajax'] + 'preview/topic/';
    ls.hook.marker('previewBefore');
    ls.ajaxSubmit(url, form, function (result) {
      if (result.bStateError) {
        ls.msg.error(null, result.sMsg);
      } else {
        preview.show().html(result.sText);
        ls.hook.run('ls_topic_preview_after', [form, preview, result]);
      }
    });
  };

  this.insertImageToEditor = function (sUrl, sAlign, sTitle) {
    var windowUploadImg = $('#window_upload_img');

    sAlign = sAlign == 'center' ? 'class="image-center"' : 'align="' + sAlign + '"';
    $.markItUp({replaceWith: '<img src="' + sUrl + '" title="' + sTitle + '" ' + sAlign + ' />'});
    windowUploadImg.find('input[type="text"]').val('');
    windowUploadImg.jqmHide();
    return false;
  };

  return this;
}).call(ls.topic || {}, jQuery);