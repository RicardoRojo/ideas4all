require 'minitest/autorun'
require_relative 'book_category_counter'

class BookCategoryCounterTest < Minitest::Test

  def setup;end

  def test_returns_data_formatted
    stockpile = ["ABART 20"]
    category_list = ["A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20)", @bookcounter.books_by_category)
  end

  def test_returns_category_data_separated_by_dash
    stockpile = ["ABART 20", "CDXEF 50"]
    category_list = ["A", "C"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20) - (C : 50)", @bookcounter.books_by_category)
  end

  def test_returns_data_with_codes_of_3_letters
    stockpile = ["ABA 20"]
    category_list = ["A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20)", @bookcounter.books_by_category)
  end

  def test_returns_data_with_codes_of_more_of_3_letters
    stockpile = ["ABART 20"]
    category_list = ["A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20)", @bookcounter.books_by_category)
  end

  def test_returns_data_with_amount_of_1_digit
    stockpile = ["ABART 2"]
    category_list = ["A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 2)", @bookcounter.books_by_category)   
  end

  def test_returns_data_with_amount_of_more_of_1_digit
    stockpile = ["ABART 20"]
    category_list = ["A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20)", @bookcounter.books_by_category)  
  end

  def test_return_empty_if_stocklist_empty
    stockpile = []
    category_list = ["A", "B", "C", "W"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("", @bookcounter.books_by_category)
  end

  def test_return_empty_if_category_list_empty
    stockpile = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
    category_list = []
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("", @bookcounter.books_by_category)
  end

  def test_sums_all_books_in_category_if_multiple_entries_in_stocklist
    stockpile = ["BKWRK 25", "BTSQZ 89"]
    category_list = ["B"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(B : 114)", @bookcounter.books_by_category)
  end

  def test_return_only_categories_in_category_list
    stockpile = ["BKWRK 25", "BTSQZ 89", "CDXEF 50"]
    category_list = ["B"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(B : 114)", @bookcounter.books_by_category)
  end

  def test_return_cero_if_category_has_no_books
    stockpile = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
    category_list = ["W"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(W : 0)", @bookcounter.books_by_category)
  end

  def test_return_categories_sorted
    stockpile = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
    category_list = ["W", "A"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20) - (W : 0)", @bookcounter.books_by_category)
  end

  def test_example_works
    stockpile = ["ABART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"]
    category_list = ["A", "B", "C", "W"]
    @bookcounter = BookCategoryCounter.new(stockpile,category_list)
    assert_equal("(A : 20) - (B : 114) - (C : 50) - (W : 0)", @bookcounter.books_by_category)
  end
end
