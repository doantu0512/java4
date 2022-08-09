function minusNumber(id){
    var idClick = '#' + id;
    var idData = $(idClick).attr('data-id');
    var targetData = $(idClick).attr('data-target');
    var idTarget = '#' + targetData + idData;
    // Lấy giá trị hiện tại
    var value = parseInt($(idTarget).val());
    // var value = $(idTarget).val();
    var newValue;
    if(value == 1){
        newValue = 1;
    }else{
        newValue = value - 1;
    }
    $(idTarget).val(newValue);
    // console.log(newValue);
}
function plusNumber(id){
    var idClick = '#' + id;
    var idData = $(idClick).attr('data-id');
    var targetData = $(idClick).attr('data-target');
    var idTarget = '#' + targetData + idData;
    // Lấy giá trị hiện tại
    var value = parseInt($(idTarget).val());
    // var value = $(idTarget).val();
    var newValue = value + 1;
    $(idTarget).val(newValue);
}