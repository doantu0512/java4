// Phần hover bộ lọc
function checkboxHoverCategory(id){
    var idName = '#' + id;
    var dataName = $(idName).attr('data-name');
    var dataId = $(idName).attr('data-id');
    var valueInput = 'color_' + dataId;
    var nameInput = 'color_' + dataId;
    if($('input:checkbox[name='+nameInput+']:checked').length == 0){
        // Chưa check
        $('input:checkbox[name='+nameInput+']').prop('checked', true);
        $(idName).css({'opacity' : 1});
    }else{
        // Đã check
        $('input:checkbox[name='+nameInput+']').prop('checked', false);
        $(idName).css({'opacity' : 0.5});
    }
}










