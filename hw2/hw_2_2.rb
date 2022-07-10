def process_str(string)
  string.gsub!("#{string[string.index('#') - 1]}#", '') while string.include?('#')
  string
end

p process_str('abc##d######')
