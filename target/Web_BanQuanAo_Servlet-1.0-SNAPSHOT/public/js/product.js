// Chi tiết sản phẩm
$('.owl-one').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    // dotClass: 'owl-dot1',
    // dotsClass:'owl-dots1',
    // navContainerClass: 'owl-nav1',
    dots: true,
    nav: true,
    slideBy:5,
    items:5,
    lazyLoadEager:3,
    // loadedClass: 'owl-loaded',
    smartSpeed: 100,
    responsiveClass:true,
    loop: false,
    margin: 4,
    // responsive:{
    //     0:{
    //         items:1
    //     },
    //     600:{
    //         items:3
    //     },
    //     1000:{
    //         items:5
    //     }
    // }
});

var owl = $('.owl-one');
owl.owlCarousel();
// Go to the next item
$('.customNextBtn').click(function() {
    owl.trigger('next.owl.carousel');
})
// Go to the previous item
$('.customPrevBtn').click(function() {
    // With optional speed parameter
    // Parameters has to be in square bracket '[]'
    owl.trigger('prev.owl.carousel', [100]);
})
$( '.owl-dot' ).on( 'click', function() {
    owl.trigger('to.owl.carousel', [$(this).index(), 100]);
    $( '.owl-dot' ).removeClass( 'active' );
    $(this).addClass( 'active' );
  })
  $( '.owl-dot span .fa-circle' ).on( 'click', function() {
    owl.trigger('to.owl.carousel', [$(this).index(), 100]);
    $( '.owl-dot' ).removeClass( 'active' );
    $(this).parent().parent().addClass( 'active' );
  })

// Sản phẩm liên quan
$('.owl-two').owlCarousel({
    loop:true,
    margin:30,
    nav:true,
    dotClass: 'owl-dot2',
    dotsClass:'owl-dots2',
    navContainerClass: 'owl-nav2',
    navClass: '[&#x27;owl-prev2&#x27;,&#x27;owl-next2&#x27;]',
    dots: true,
    nav: true,
    autoplay: true,
    autoPlaySpeed: 500,
    autoPlayTimeout: 500,
    autoplayHoverPause: true,
    slideBy:5,
    items:4,
    lazyLoadEager:3,
    // loadedClass: 'owl-loaded',
    smartSpeed: 100,
    responsiveClass:true,
    loop: false,
    margin: 4,
    responsive:{
        0:{
            items:2
        },
        600:{
            items:3
        },
        1000:{
            items:4
        }
    }
});

var owl2 = $('.owl-two');
owl2.owlCarousel();
// Go to the next item
$('.customNextBtn2').click(function() {
    owl2.trigger('next.owl.carousel', [300]);
})
// Go to the previous item
$('.customPrevBtn2').click(function() {
    // With optional speed parameter
    // Parameters has to be in square bracket '[]'
    owl2.trigger('prev.owl.carousel', [300]);
})









  var nameSrc = $('.product_images_big').attr('src');
//   console.log(nameSrc);
//   Thay đổi ảnh lớn khi người dùng click vào ảnh nhỏ
function changeImage(id){
    var idName = '#' + id;
    var imageTarget = $(idName).attr('data-target-image');
    // console.log(imageTarget);
    // Remove ảnh lớn hiện tại thay bằng ảnh mới
    $('.product_images_big').attr('src', imageTarget);
    nameSrc = $('.product_images_big').attr('src');
    // console.log(nameSrc);
    // imageZoom('product_images_big','product_images_big_zoom');
}
// Phần chọn color
function changeBorderColor(id){
    // console.log(id);
    var idColor = '#' + id;
    var dataId = $(idColor).attr('data-id');
    var dataName = $(idColor).attr('data-name'); 
    // console.log(dataId);
    $('.product_color_list').css('border', '2px solid transparent');
    $(idColor).css({'border' : '2px solid red'});
    // Gán giá trị từ numberId đễ input radio check
    // $('input:radio[name=colorID][value='+numberId+']').prop('checked',true);
    $('[name=colorID]').val([dataId]);
    // Lấy giá trị khi đã check
    var myRadio = $('input[name=dataId]:checked').val();
    // console.log(myRadio);
}
    
function hoverBorderColor(id){
    // console.log(id);
    var idHover = '#' + id;
    var dataId = $(idHover).attr('data-id');
    var dataName = $(idHover).attr('data-name'); 
    var myRadioColor = $('input[name=colorID]:checked').val();
    var idCheck = dataName + myRadioColor;
    if(id == idCheck){
        $(idHover).css({'border' : '2px solid red'});
    }else{
        $(idHover).css({'border' : '2px solid green'});
    }
}
function outBorderColor(id){
    var idHover = '#' + id;
    var dataId = $(idHover).attr('data-id');
    var dataName = $(idHover).attr('data-name'); 
    var myRadioColor = $('input[name=colorID]:checked').val();
    var idCheck = dataName + myRadioColor;
    // console.log(idCheck);
    if(id == idCheck){
        $(idHover).css({'border' : '2px solid red'});
    }else{
        $(idHover).css({'border' : '2px solid transparent'});
    }
    
}
// Size
function changeBorderSize(id){
    var idClick = '#' + id;
    var dataId = $(idClick).attr('data-id');
    var dataName = $(idClick).attr('data-name');
    $('.product_size_list').css({'border' : '2px solid transparent'});
    $(idClick).css({'border' : '2px solid red'});
    $('input:radio[name=sizeID][value='+dataId+']').prop('checked','true');
}
function hoverBorderSize(id){
    var idHover = '#' + id;
    var dataId = $(idHover).attr('data-id');
    var dataName = $(idHover).attr('data-name');
    var myRadioSize = $('input[name=sizeID]:checked').val();
    var idCheck = dataName + myRadioSize;
    // console.log(id);
    // console.log(idCheck);
    if(id == idCheck){
        $(idHover).css({'border' : '2px solid red'});
    }else{
        $(idHover).css({'border' : '2px solid green'});
    }
}
function outBorderSize(id){
    var idHover = '#' + id;
    var dataId = $(idHover).attr('data-id');
    var dataName = $(idHover).attr('data-name');
    var myRadioSize = $('input[name=sizeID]:checked').val();
    var idCheck = dataName + myRadioSize;
    // console.log(id);
    // console.log(idCheck);
    if(id == idCheck){
        $(idHover).css({'border' : '2px solid red'});
    }else{
        $(idHover).css({'border' : '2px solid transparent'});
    }
}
// Tăng qty
function PlusQty(){
    // Lấy giá trị hiện tại của modalQty
    var valueQty = parseInt(document.getElementById('productQty').value);
    // console.log(valueQty);
    var newValue = valueQty+1;
    // console.log(newValue);
    $('#productQty').val(newValue);
}
function MinusQty(){
    var valueQty = parseInt(document.getElementById('productQty').value);
    console.log(valueQty);
    var newValue;
    if(valueQty === 1){
        newValue = 1;
    }else{
        newValue = valueQty-1;
    }
    // console.log(newValue);
    $('#productQty').val(newValue);
}
function InputQty(){
    var valueInput = document.getElementById('productQty').value;
    if(isNaN(parseInt(valueInput))){
        // console.log('Nhập sai')
        $('#productQty').val(1);
    }else{
        // console.log('Nhập đúng');
        $('#productQty').val(parseInt(valueInput));
    }
    // console.log(p);
}

// Zoom Ảnh
function imageZoom(imgID, resultID) {
    var img, lens, result, cx, cy;
    img = document.getElementById(imgID);
    result = document.getElementById(resultID);
    /*create lens:*/
    lens = document.createElement("DIV");
    lens.setAttribute("class", "img-zoom-lens");
    /*insert lens:*/
    img.parentElement.insertBefore(lens, img);
    /*calculate the ratio between result DIV and lens:*/
    cx = result.offsetWidth / lens.offsetWidth;
    cy = result.offsetHeight / lens.offsetHeight;
    /*set background properties for the result DIV:*/
    result.style.backgroundImage = "url('" + img.src + "')";
    result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
    /*execute a function when someone moves the cursor over the image, or the lens:*/
    lens.addEventListener("mousemove", moveLens);
    img.addEventListener("mousemove", moveLens);
    /*and also for touch screens:*/
    lens.addEventListener("touchmove", moveLens);
    img.addEventListener("touchmove", moveLens);
    function moveLens(e) {
      var pos, x, y;
      /*prevent any other actions that may occur when moving over the image:*/
      e.preventDefault();
      /*get the cursor's x and y positions:*/
      pos = getCursorPos(e);
      /*calculate the position of the lens:*/
      x = pos.x - (lens.offsetWidth / 2);
      y = pos.y - (lens.offsetHeight / 2);
      /*prevent the lens from being positioned outside the image:*/
      if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
      if (x < 0) {x = 0;}
      if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
      if (y < 0) {y = 0;}
      /*set the position of the lens:*/
      lens.style.left = x + "px";
      lens.style.top = y + "px";
      /*display what the lens "sees":*/
      result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
    }
    function getCursorPos(e) {
      var a, x = 0, y = 0;
      e = e || window.event;
      /*get the x and y positions of the image:*/
      a = img.getBoundingClientRect();
      /*calculate the cursor's x and y coordinates, relative to the image:*/
      x = e.pageX - a.left;
      y = e.pageY - a.top;
      /*consider any page scrolling:*/
      x = x - window.pageXOffset;
      y = y - window.pageYOffset;
      return {x : x, y : y};
    }
  }
//   imageZoom('product_images_big','product_images_big_zoom');