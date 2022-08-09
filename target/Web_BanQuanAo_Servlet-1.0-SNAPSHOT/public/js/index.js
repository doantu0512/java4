var widthAll = screen.width;
// Xet chiều cao phần app_slider
var img = document.getElementById('heightImage'); 
var width = img.clientWidth;
var height = img.clientHeight;
var heightAppSlider = document.getElementById('app_slider').clientHeight;
// console.log(heightAppSlider);
// Set margin cho phần container
if(widthAll > 1025){
    var paddingtop = (heightAppSlider + 40) + 'px';
    // console.log(paddingtop);
    $('.app_container').css({'padding-top' : paddingtop});
}else{
    var paddingtop = (heightAppSlider + 20 + 50) + 'px';
    // console.log(paddingtop);
    $('.app_container').css({'padding-top' : paddingtop});
}

// Khi thay đổi kích thước màn hình
window.onresize = function(event) {
    heightAppSlider = document.getElementById('app_slider').clientHeight;
    // console.log(heightAppSlider);
    // Set margin cho phần container
    if(widthAll > 1025){
        paddingtop = (heightAppSlider + 40) + 'px';
        // console.log(paddingtop);
        $('.app_container').css({'padding-top' : paddingtop});
    }else{
        paddingtop = (heightAppSlider + 20 + 50) + 'px';
        // console.log(paddingtop);
        $('.app_container').css({'padding-top' : paddingtop});
    }
};

//// Xét khi người dùng scroll, phần menu navbar sẽ fixx
// var widthAll = screen.width;
// console.log(widthAll);
if(widthAll > 1025){
    var checkScrool = false;
    window.addEventListener('scroll', function(ev) {
    
        var someDiv = document.getElementById('abc');
        var distanceToTop = someDiv.getBoundingClientRect().top;
        // console.log(distanceToTop);
        
        if(distanceToTop <= -42 && checkScrool == false || distanceToTop <= 44 && checkScrool == true){
            checkScrool = true;
            var x1 = -45;
            // $(".header_topbar").css({"background" : "black", "height" : '50px', "z-index" : 4});
            $(".header_topbar").css({"height" : '50px', "z-index" : 4});
    
            $(".header_navbar").css({"position" : "fixed", "height" : '50px', "background" : "black", "padding-top" : 14+'px', "z-index" : 5});
            // $(".header_topbar").css({"position" : "fixed", "z-index" : 1});
            blackNav = true;
            // console.log(blackNav);
        }else if(distanceToTop == 50 || distanceToTop == 0){
            $(".header_topbar").css({"background" : "", "height" : '', "z-index" : 5});
            $(".header_navbar").css({"position" : "relative", "height" : '95px', "background" : "linear-gradient(#25211e, rgba(37,33,30,0))","padding-top" : '55px', "z-index" : 4});
            blackNav = false;
            // console.log(blackNav);
        }
        // thay đổi background phần header 
        if(blackNav == false){
            $(".header_navbar_list").hover(function(){
                $(".header_navbar").css("background", "black");
            }, function(){
                $(".header_navbar").css("background", "linear-gradient(#25211e, rgba(37,33,30,0))");
            });
            
        }else{
            $(".header_navbar_list").hover(function(){
                $(".header_navbar").css("background", "black");
            }, function(){
                $(".header_navbar").css("background", "black");
            });
        }
     });
    
}else{
    blackNav =true;
}
// thay đổi background phần header 
if(blackNav == false){
    $(".header_navbar_list").hover(function(){
        $(".header_navbar").css("background", "black");
    }, function(){
        $(".header_navbar").css("background", "linear-gradient(#25211e, rgba(37,33,30,0))");
    });
    
}
