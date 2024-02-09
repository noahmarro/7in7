mt = {
  __index = strict_read,
  __newindex = strict_write
}
treasure = {}
setmetatable(treasure, mt)

_private = {}
function strict_read(_, key)
  if _private[key] then
    return _private[key]
  else
    error('invalid key: ' .. key)
  end
end

function strict_write(_, key, value)
  if value and _private[key] then
    error('duplicate key: ' .. key)
  else
    _private[key] = value
  end
end
