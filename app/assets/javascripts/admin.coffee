# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  window.ycm = window.ycm || {data: {}}
  console.log(window.ycm.data)
  window.ycm.getPageId = () ->
    window.ycm.data.pageId || 0
  window.ycm.getCSRFToken = () ->
    window.ycm.data.csrf_token

  $('.wysiwyg-field').editable({
    inlineMode: false,
#    buttons: [ 'bold', 'italic', 'underline', 'strikeThroughe', 'html','AttentionBox'],
    buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript',
              'fontFamily', 'fontSize', 'color', 'formatBlock', 'blockStyle', 'inlineStyle',
              'align', 'insertOrderedList', 'insertUnorderedList', 'outdent', 'indent', 'selectAll',
              'createLink', 'insertImage', 'insertVideo', 'table', 'undo', 'redo', 'html', 'save',
              'insertHorizontalRule', 'uploadFile', 'removeFormat', 'fullscreen', 'AttentionBox'],
    customButtons: {
      AttentionBox: {
        title: 'attention box',
        icon: {
          type: 'font',
          value: 'fa fa-commenting-o'
        },
        callback: () ->
          this.insertHTML('<div class="attention-block"></div>');
      }
    },
    fileUploadURL: '/admin/image_uploader',
    fileUploadParams: {
      page_id: window.ycm.getPageId(),
      authenticity_token: window.ycm.getCSRFToken()
    }
  })

