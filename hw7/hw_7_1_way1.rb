# Создать модуль с набором полезных методов для строк. Например, чтобы модуль содержал метод capitalize_each_word:
# 'some new string'.capitalize_each_word #=> "Some New String"
#
# 1-ый вариант использования
#
# 'string one'.capitalize_each_word
# 'string two'.capitalize_each_word
#

module StringEditor
  def capitalize_each_word
    split(' ').map(&:capitalize).join(' ')
  end
end

class String
  include StringEditor
end

puts 'string one'.capitalize_each_word
puts 'string two'.capitalize_each_word
