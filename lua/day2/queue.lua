Queue = {
  new = function(self, items)
    self.__index = self
    local obj = setmetatable({
      first = math.mininteger + 1,
      last = math.mininteger,
    }, self)
    for _, item in pairs(items or {}) do
      obj:add(item)
    end
    return obj
  end,
  add = function(self, item)
    local last = self.last + 1
    self.last = last
    self[last] = item
  end,
  remove = function(self)
    if self.first > self.last then
      return nil
    else
      local first = self.first
      local value = self[first]
      self[first] = nil
      self.first = first + 1
      return value
    end
  end
}

local q = Queue:new { 'hello' }
q:add('world')
local p = Queue:new()
p:add('next')
print(q:remove(), q:remove(), q:remove())
print(p:remove())
