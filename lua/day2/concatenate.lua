setmetatable(_G, {
  __newindex = function(table, key, value)
    if type(value) == 'table' then
      rawset(table, key, setmetatable(value, { __add = Concatenate }))
    else
      rawset(table, key, value)
    end
  end
})
function Concatenate(...)
  local concat = {}
  for _, tab in pairs({ ... }) do
    for _, value in pairs(tab) do
      table.insert(concat, value)
    end
  end
  return concat
end

A = { 1 }
B = { 2 }
C = { 3 }
print(table.concat(A + B + C, ' '))
