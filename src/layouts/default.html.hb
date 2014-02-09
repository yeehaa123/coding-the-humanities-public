<html>
<head>
  <title>{{ document.title }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link href='http://fonts.googleapis.com/css?family=Abel|Codystar' rel='stylesheet' type='text/css'>
  {{{ getBlock "styles" "styles/main.css" }}}
  {{{ getBlock "scripts" "./scripts/script.js" }}}
</head>
<body>
  <div class="menu-panel default">
    <nav class="main-nav">
      {{> menu pages }}
    </nav>
  </div>
  <header class="site-header">
    <img src="./images/menu-button.svg" class="menu-button"></h2>
    <h1><a href="./">Coding the Humanities</a></h1>
  </header>
  <div class="main">
    {{{ content }}}
  </div>
  <footer></footer>
  {{{ getBlock "scripts" "./app/bower_components/classie/classie.js" }}}
  <script>
    var menuPanel = document.querySelector('.menu-panel'),
        menuButton = document.querySelector('.menu-button'),
        body = document.querySelector('body');  
    menuButton.onclick = function() {
      classie.toggle(this, 'active');
      classie.toggle(body, 'pushed');
      classie.toggle(menuPanel, 'open');
      classie.toggle(menuPanel, 'closed');
    }
  </script>
</body>
</html>
