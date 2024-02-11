-- Call the body() function.
-- If body() errors restart body() from its beginning.
-- Retry maximum count times; if you exceed count, print an error message and return.
-- If body() returns, consider this a success.
-- Hint: You may need to create more than one coroutine

local function retry(count, body)
  local i = count
  while i > 0 do
    local th = coroutine.create(body)
    local succeeded, value = coroutine.resume(th)
    if succeeded then
      return value
    else
      i = i - 1
    end
  end
  error("We've tried " .. count .. " times, but didn't succeed")
end

print(retry(5, function()
  if math.random() > 0.2 then
    error('Something bad happened')
  end
  coroutine.yield('Succeeded')
end))
