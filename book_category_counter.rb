class BookCategoryCounter
  attr_accessor :books_hash, :result
  attr_reader :stockpile, :category_list

  def initialize(stock,category)
    @stockpile = stock
    @category_list = category
    @books_hash = {}
    @result = {}
  end

  def books_by_category
    return "" if stockpile.empty?
    return "" if category_list.empty?
    get_books_hash
    get_requested_categories
    print_hash(result)
  end

  def get_requested_categories
    category_list.each do |category|
      books_hash[category].nil? ? result[category] = 0 : result[category] = books_hash[category]
    end
  end

  def get_books_hash
    stockpile.each do |item|
      letter = item.chr
      number = item.split.last
      books_hash[letter].nil? ? books_hash[letter] = number.to_i : books_hash[letter] += number.to_i
    end
  end

  def print_hash(results_hash)
    results_hash.sort.map {|letter,number| "(#{letter} : #{number})"}.join(" - ")
  end
  
end