function wait(t){
  setTimeout(function(){
    if (window.jQuery){
      $('.slide').hide();
      $('.site-nav').add('footer').fadeOut(1500, function(){
        impress().init();
        $('.slide').fadeIn(500);
      });
    } else {
      wait(500);
    }
  },t)
}
wait(0);
