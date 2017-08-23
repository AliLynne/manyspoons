n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

def left_rotate(a,k)
  k.times do
    b = a.shift
    a = a.push(b)

  end
  print a.join(' ')
end

left_rotate(a,k)
