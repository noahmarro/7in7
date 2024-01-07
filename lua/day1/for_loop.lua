local function for_loop(a, b, f, ...)
  if a <= b then
    f(...)
    for_loop(a + 1, b, f, ...)
  end
end

for_loop(1, 5, print, "hey!")
