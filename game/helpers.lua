local helpers = {}


function helpers.cloneTable(obj, seen)
    -- Handle non-tables and previously-seen tables.
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
  
    -- New table; mark it as seen and copy recursively.
    local s = seen or {}
    local res = {}
    s[obj] = res
    for k, v in pairs(obj) do res[helpers.cloneTable(k, s)] = helpers.cloneTable(v, s) end
    return setmetatable(res, getmetatable(obj))
end


-- DON'T USE!! UNSTABLE!!
function helpers.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[helpers.deepcopy(orig_key)] = helpers.deepcopy(orig_value)
        end
        setmetatable(copy, helpers.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


function helpers.copyOBJ(obj, seen)
    if type(obj) ~= 'table' then return obj end
    if seen and seen[obj] then return seen[obj] end
    local s = seen or {}
    local res = setmetatable({}, getmetatable(obj))
    s[obj] = res
    for k, v in pairs(obj) do res[helpers.copy(k, s)] = helpers.copy(v, s) end
    return res
end

return helpers