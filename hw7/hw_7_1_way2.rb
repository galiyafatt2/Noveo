# 2-ый вариант использования
#
# str1 = 'string one'
# str2 = 'string two'
# ....
# str1.capitalize_each_word => "String One"
# str2.capitalize_each_word => NoMethodErro

module StringEditor
  def capitalize_each_word
    split(' ').map(&:capitalize).join(' ')
  end
end

str1 = 'string one'
str2 = 'string two'
str1.extend StringEditor
puts str1.capitalize_each_word  # "String One"
puts str2.capitalize_each_word
