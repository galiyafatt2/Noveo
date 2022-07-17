def s_to_h(string)
  return {} if string.empty?
  string.split(', ').map do |hash|
    v_left, v_right = hash.split('=')
    {v_left => v_right}
    end.reduce(:merge)
end
p s_to_h "a=1, b=2, c=3, d=4"
