module Defs  
  def ordered_uniq_rand_numbers (how_many, range)
    a = []
    while a.size < how_many do
      a << rand(range)
      a.uniq!
    end
    a.sort
  end
end