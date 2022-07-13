def s_to_h(string)
  return {} if string.empty?
  string.split(', ').map{|h|
    h1, h2 = h.split('=')
    {h1 => h2}
  }.reduce(:merge)
end
p s_to_h "a=1, b=2, c=3, d=4"
