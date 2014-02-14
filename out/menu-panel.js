(function() {
  var body, menuButton, menuPanel;

  menuPanel = document.querySelector('.menu-panel');

  menuButton = document.querySelector('.menu-button');

  body = document.querySelector('body');

  menuButton.onclick = function() {
    classie.toggle(this, 'active');
    classie.toggle(body, 'pushed');
    classie.toggle(body, 'default');
    classie.toggle(menuPanel, 'open');
    return classie.toggle(menuPanel, 'default');
  };

}).call(this);
