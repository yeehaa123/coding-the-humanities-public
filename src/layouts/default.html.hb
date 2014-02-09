<html>
<head>
  <title>{{ document.title }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link href='http://fonts.googleapis.com/css?family=Abel|Codystar' rel='stylesheet' type='text/css'>
  {{{ getBlock "styles" "styles/main.css" }}}
  {{{ getBlock "scripts" "./scripts/script.js" }}}
</head>
<body>
  <div class="sidebar">
    <nav class="main-nav">
      {{> menu pages }}
    </nav>
  </div>
  <header class="site-header">
    <img src="./images/menu-button.svg" class="menu-button"></h2>
    <h1><a href="./">Coding the Humanities</a></h1>
  </header>
  <div class="main">
    <nav class="site-nav">
      <ul>
       <li>Yeehaa</li>
       <li>23/12/2013</li>
      </ul>
    </nav>
    <div class="content">
      {{{ content }}}
    </div>
  </div>
  <footer></footer>
  {{{ getBlock "scripts" "./app/bower_components/classie/classie.js" }}}
  <script>
    var sidebar = document.querySelector('.sidebar'),
        menuButton = document.querySelector('.menu-button'),
        body = document.querySelector('body');  
    menuButton.onclick = function() {
      classie.toggle(this, 'active');
      classie.toggle(body, 'pushed');
      classie.toggle(sidebar, 'open');
    }
  </script>
</body>
</html>
