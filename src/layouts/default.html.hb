<html>
<head>
  <title>{{ document.title }}</title>
  {{{ getBlock "styles" "styles/main.css" }}}
</head>
<body>
  <header class="site-header">
    <h1><a href="/">Coding the Humanities</a></h1>
  </header>
  <div class="main">
    <nav class="site-nav">
      {{> menu pages }}
    </nav>
    <div class="content">
      {{{ content }}}
    </div>
  </div>
  <footer></footer>
</body>
{{{ getBlock "scripts" "/vendor/jquery.js" }}}
{{{ getBlock "scripts" "/scripts/script.js" }}}
</html>
