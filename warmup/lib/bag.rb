class Bag
  attr_reader :count,
              :candies

  def initialize
    @count = 0
    @candies = []
  end

  def empty?
    count > 0 ? false : true
  end

  def add_candy(candy)
    @candies << candy
    @count += 1
  end

  def remove_candy
    @candies.pop
    @count -= 1
  end

  def contains?(string)
    @candies.any? { |candy| candy.type === string } 
  end
end