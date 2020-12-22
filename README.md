# visual_call_html

This gem use gojs for graphing

![](https://images.viblo.asia/27d860a4-482d-42e4-8b70-f549ce4e3704.png)

# Install

```rb
gem install 'visual_call_html'
```

# Example

```rb
require 'visual_call_html'

def fibonacci n
  return n if (0..1).include? n

  fibonacci(n - 1) + fibonacci(n - 2)
end

VisualCallHtml.trace(display_return_value: true) { fibonacci(6) }
```
