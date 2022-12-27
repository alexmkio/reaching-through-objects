require_relative '../lib/bag'

class TrickOrTreater
  attr_accessor :costume,
                :bag

  def initialize(costume)
    @costume = costume
    @bag = Bag.new
  end

  def dressed_up_as
    @costume.style
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.count
  end

  def eat
    @bag.remove_candy
  end
end