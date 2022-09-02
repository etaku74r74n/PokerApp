module Hands

  def search_hands(cards)
    #受け取ったカードを、スートとナンバーに分ける
    @suit_array = cards.scan(/[SHDC]/)
    @num_array = cards.scan(/1[0-3]|[1-9]/).map(&:to_i).sort
    judge
  end

  def flush?
    true if @suit_array.uniq.length == 1
  end

  def straight?
    true if ( (@num_array.uniq.length == 5) && (@num_array.max - @num_array.min == 4) ) || @num_array == [1, 10, 11, 12, 13]
  end

  def combination
    @num_count_array = []
    @num_array.uniq.each do |num| # 同じナンバーを数えて、それを配列で出す。
      @num_count_array << @num_array.count(num)
    end
    @num_count_array.sort!
  end

  def four_card?
    true if @num_count_array == [1, 4]
  end

  def full_house?
    true if @num_count_array == [2, 3]
  end

  def three_card?
    true if @num_count_array == [1, 1, 3]
  end

  def two_pair?
    true if @num_count_array == [1, 2, 2]
  end

  def one_pair?
    true if @num_count_array == [1, 1, 1, 2]
  end

  def judge
    combination
    if flush? && straight?
      { :name => "ストレートフラッシュ", :score => 8 }
    elsif four_card?
      { :name => "フォーカード", :score => 7 }
    elsif full_house?
      { :name => "フルハウス", :score => 6 }
    elsif flush?
      { :name => "フラッシュ", :score => 5 }
    elsif straight?
      { :name => "ストレート", :score => 4 }
    elsif three_card?
      { :name => "スリーカード", :score => 3 }
    elsif two_pair?
      { :name => "ツーペア", :score => 2 }
    elsif one_pair?
      { :name => "ワンペア", :score => 1 }
    else
      { :name => "ハイカード", :score => 0 }
    end
  end

  module_function :search_hands, :combination, :flush?, :straight?, :full_house?, :four_card?, :three_card?, :two_pair?, :one_pair?, :judge

end

