require 'benchmark'
require 'http'

Benchmark.bm do |rep|
  n = 1
  rep.report("IO operation") do
    n.times do
      HTTP.get("https://google.com")
    end
  end

  rep.report("CPU operation") do
    100.times do |n|
      n * n - 1
    end
  end
end