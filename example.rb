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
