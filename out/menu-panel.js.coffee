menuPanel = document.querySelector('.menu-panel')
menuButton = document.querySelector('.menu-button')
body = document.querySelector('body')

menuButton.onclick = -> 
  classie.toggle(this, 'active')
  classie.toggle(body, 'pushed')
  classie.toggle(body, 'default')
  classie.toggle(menuPanel, 'open')
  classie.toggle(menuPanel, 'default')
