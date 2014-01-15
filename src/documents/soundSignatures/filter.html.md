---
title: "Filter"
section-title: "Signal Processing"
type: "normal"
section: 3
order_prop: 40
---

```javascript
_.filter = _.select = function(obj, iterator, context) {
  var results = [];
  if (obj == null) return results;
  if (nativeFilter && obj.filter === nativeFilter) 
     return obj.filter(iterator, context);
  each(obj, function(value, index, list) {
    if (iterator.call(context, value, index, list)) 
      results.push(value);
  });
  return results;
};
```
