---
title: Imperative
type: normal
section-title: Coding the Humanities
section: 3
order_prop: 72
---
<div class="imperative">
  <p>$(document).ready(function(){</p>
  <p class="indent">  var words, text, wordsString;</p>
  <p class="indent">  text = $('article').innerText();</p> 
  <p class="indent">  words = filterWords(text, blacklist);</p>
  <p class="indent">  wordsString = words.join(", ");</p>
  <p class="indent">  $('body').append(wordsString);
  <p>});</p>
</div>
