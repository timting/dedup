File.open("test.txt", "w") do |file|
  array = (1..50_000).to_a * 2
  array.shuffle!
  array.each do |number|
    file.write "spondylosis#{number}@timting.com\n"
  end
end