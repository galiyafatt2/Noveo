# Нужно реализовать класс PaginationHelper, который позволит пагинировать массив.
#   Класс получает в конструктор сам массив и число элементов для дробления массива.
#
#   Пример работы:
#            helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
#
# helper.page_count() # 2
# helper.item_count() # 6
# helper.page_item_count(0)  # 4, т.к нумерация страниц с 0
# helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
# helper.page_item_count(2) # -1
# page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится

# helper.page_index(5) # 1
# helper.page_index(2) # 0
# helper.page_index(20) # -1
# helper.page_index(-10) # -1

class PaginationHelper
  attr_reader :arr, :num_of_el
  def initialize(arr, num_of_el)
    @arr = arr
    @num_of_el = num_of_el
  end

  def page_count
    (arr.size.to_f / num_of_el).ceil
  end

  def item_count
    arr.size
  end

  def page_item_count(n_page)
    return -1 if n_page < 0 || n_page > (page_count-1)
    return num_of_el if n_page < item_count / num_of_el
    return item_count % num_of_el
  end

  def page_index(elem_index)
    return -1 if elem_index < 0 || elem_index > item_count
    return elem_index / num_of_el
  end
end


helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)

p helper.page_count # 2
p helper.item_count # 6
p helper.page_item_count(0)  # 4, т.к нумерация страниц с 0
p helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
p helper.page_item_count(2) # -1
p helper.page_index(5) #1
p helper.page_index(2) #0
p helper.page_index(20) # -1
p helper.page_index(-10) # -1
