const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    initialEditType: 'markdown',
    previewStyle: 'vertical',
    width: '95%',
    height: '500px'
});

$('#edit-submit-btn').click(function() {
    var content = editor.getHTML();
    $('#goods-content').val(content);
})