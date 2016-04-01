def uniq_rand_number(how_many, range)
  a = []
  while a.size < how_many do
    a << rand(range)
    a.uniq!
  end
  a
end


def test_uniq_rand_number
  result = true
  100000.times { 
    array_of_uniq_numbers = uniq_rand_number(3, 1..5)
    result = result && (array_of_uniq_numbers == array_of_uniq_numbers.uniq)
  }
  result
end

#puts uniq_rand_number(3, 1..5) \
#puts test_uniq_rand_number

puts "our method correct? #{test_uniq_rand_number}"
#expect test_uniq_rand_number to be eq test_uniq_rand_number.uniq