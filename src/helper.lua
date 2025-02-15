function CopyValue(val)
    if type(val) ~= 'table' then return val end

    local out = {}
    for k,v in pairs(val) do
        out[k] = CopyValue(v)
    end

    return out
end