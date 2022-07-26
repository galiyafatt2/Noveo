# Нужно реализовать класс VersionManager. Конструктор опционально должен принимать строку - версию.
# Допустимые варианты строки: “{major}” (“1”), “{major}.{minor}” (“1.1”), “{major}.{minor}.{patch}” (“1.1.1”).
# В варианте типа "1.1.1.1.1" оставить только первые три значения версии.
# Если часть версии - не целое число (напр. "а.4.е"), то генерировать ошибку.
# Если версия не указана, то значение по умолчанию - “0.0.1”.

class VersionManager
  attr_accessor :major, :minor, :patch, :save

  def initialize(version = '0.0.1')
    vers_str = version.split('.')
    @major = Integer(vers_str[0])
    @minor = vers_str.size > 1 ? Integer(vers_str[1]) : 0
    @patch = vers_str.size > 2 ? Integer(vers_str[2]) : 0
    @save = []
  end

  def major!
    @save << [major, minor, patch]
    @major += 1
    @minor = 0
    @patch = 0
  end

  def minor!
    @save << [major, minor, patch]
    @minor += 1
    @patch = 0
  end

  def patch!
    @save << [major, minor, patch]
    @patch += 1
  end

  def rollback!
    raise 'Can not rollback to previous version' if save[-1].nil?

    old_ver = save.pop
    @major = old_ver[0]
    @minor = old_ver[1]
    @patch = old_ver[2]
  end

  def release
    "#{major}.#{minor}.#{patch}"
  end

end

vm = VersionManager.new('1.0')

vm.major! # увеличивает мажорную версию, устанавливая минорную и патч в 0 (напр. “2.0.0”)
vm.minor! # увеличивает минорную версию, устанавливая патч в 0 (напр. “2.1.0”)
vm.patch! # увеличивает патч версию (напр. “2.1.1”)

vm.rollback! # возвращается к прошлой версии, если это возможно, иначе выдать ошибку
p vm.release
