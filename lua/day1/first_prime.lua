local function ends_in(last, num)
  if math.floor(num) % 10 == last then
    return true
  else
    return false
  end
end
local function is_prime(num)
  local primes = {
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
    179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281
  }
  for _, p in pairs(primes) do
    if num == p then
      return true
    end
  end
  if num <= 281 then
    return false
  end
  for i = 2, num - 1 do
    if num % i == 0 then
      return false
    end
  end
  return true
end

local N = 100000
local LAST_DIGIT = 1
for i = 2, N do
  if LAST_DIGIT == 2 then
    print(2)
  elseif not (LAST_DIGIT % 2 == 0) and ends_in(LAST_DIGIT, i) and is_prime(i) then
    print(i)
  end
end
