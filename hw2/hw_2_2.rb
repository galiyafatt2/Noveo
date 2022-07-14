def process_str(string)
  string.sub!("#{string[string =~ /.#/]}#", '') while string =~ /.#/
  string.delete!(string[string =~ /#/]) if string =~ /#/
  string
end

p process_str('abc##d######')
