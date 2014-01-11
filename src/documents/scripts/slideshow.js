function wait(t){
  setTimeout(function(){
    if (window.jQuery){
      impress().init();
      $('.site-nav').fadeOut(3000);
    } else {
      wait(500);
    }
  },t)
}
wait(0);
