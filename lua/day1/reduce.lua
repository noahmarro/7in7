local function reduce(max, init, f)
  if max == 1 then
    return f(init, max)
  else
    return f(max, reduce(max - 1, init, f))
  end
end

local function add(previous, next)
  return previous + next
end

local function factorial(previous, next)
  return previous * next
end

print(reduce(5, 0, add))       -- 0 + 1 + ... + 5 = n(n+1)/2
print(reduce(5, 1, factorial)) -- 1 * 2 * ... * 5 = 5!
