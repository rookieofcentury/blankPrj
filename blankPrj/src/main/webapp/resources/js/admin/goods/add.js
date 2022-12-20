const editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    initialEditType: 'WYSIWYG',
    previewStyle: 'vertical',
    width: '95%',
    height: '500px'
});

function valueOn() {
    $('#goods-content').value = editor.getHTML();
};


$('#option-added-btn').click(function() {
    var temp = '<div class="option"><input type="text" name="optionName" placeholder="옵션명"><input type="number" name="option-stock" placeholder="재고수"><label class="option-delete-btn">X</label></div>';
    $('.option-area').prepend(temp);

    function checkOn() {
        var cnt = $('input[name=optionName]').length;
        if(cnt >= 1) {
            $('input[name=stock]').attr("disabled", true);
            $('input[name=stock]').val(null);
        } else if(cnt == 0) {
            $('input[name=stock]').attr("disabled", false);
        }
    }
    
    checkOn();
    
    $('.option-delete-btn').on("click", function() {
        $(this).parent().remove();
        checkOn();
    });

});

