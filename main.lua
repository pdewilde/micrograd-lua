require "table"

Value = {}
Value.__index = Value

function Value.new(data, label, children, op)
    local self = {}
    setmetatable(self, Value)
    self.data = data
    if children == nil then
        children = {}
    end
    if op == nil then
        op = ''
    end
    self._op = op
    self._prev = children -- TODO: should be set to be same as source
    if label == nil then
        label = ''
    end
    self.label = label
    return self
end

-- function Value.__call(self, data)
--     return Value.new(data)
-- end

function Value.__add(lhs, rhs)
    return Value.new(lhs.data + rhs.data, nil, {lhs, rhs})
end

function Value.__mul(lhs, rhs)
    return Value.new(lhs.data * rhs.data, nil, {lhs, rhs})
end

function Value.__tostring(self) 
    return "Value(data=" .. self.data .. ", label=" ..  self.label ..")"
end

function Value.printPrev(self)
    for _, child in ipairs(self._prev) do
      print(child)
    end
end

--todo: trace()
--todo: draw_dot()
