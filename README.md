toy_evented
===========

A toy evented system where you can use javascript-like syntax to schedule things onto a run loop

You can run the example with:

```sh
$ ./toy_evented.rb example.rb
```

```ruby
set_timeout(1000) do
  puts "Inside the timeout!"
end

set_interval(1000) do
  puts "Inside the interval!"
end

set_interval(500) do
  puts "Interleaving guys"
end

set_timeout(10_000) do
  puts "TEN SECONDS IN!!!!!"

  set_timeout(1) { puts "BETTER BE RIGHT AFTER THE TEN SECOND PRINT" }
  set_interval(5000) { puts "FIVE SECONDS LATER!!!!" }
end

set_timeout(1) { puts "STARTED UP!" }
```

## License

Copyright (c) 2013 Andrew Warner

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
