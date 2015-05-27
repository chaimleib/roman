N2R = {
  1000 => ?M,
  500 => ?D,
  100 => ?C,
  50 => ?L,
  10 => ?X,
  5 => ?V,
  1 => ?I,
}

R2N = {}
N2R.each do |k, v|
  R2N[v] = k
end


def to_roman(num)
  result = []
  values = N2R.keys.sort.reverse
  values.each_with_index do |val, i|
    puts "#{i}: #{val} (#{N2R[val]})"
    # whole nums
    if num >= val
      rem = num / val
      num -= rem * val
      result.push N2R[val] * rem
      puts ">> #{num}: #{result[-1]}"
    end
    # partial nums 9x 4x
    num10 = num*10
    if num10 >= 9*val && i+2 < values.length
      val1 = values[i+2]
      rem = 9
      num -= rem * val1
      result.push "#{N2R[val1]}#{N2R[val]}"
      puts ">> #{num}: #{result[-1]}"
    end
    if num10 >= 4*val && num10 < 5*val && i+2 < values.length
      val1 = values[i+2]
      val5 = values[i+1]
      rem = 4
      num -= rem * val1
      result.push "#{N2R[val1]}#{N2R[val5]}"
      puts ">> #{num}: #{result[-1]}"
    end
  end
  return result.join ''
end

puts to_roman 1999
puts to_roman 1995
puts to_roman 2004
(1..20).each do |i|
  puts to_roman i
end
