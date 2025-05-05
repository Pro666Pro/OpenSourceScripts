function grl()
    local letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local randomindex = math.random(1, #letters)
    return letters:sub(randomindex, randomindex)
end
function grn()
    local randomnumber = math.random(0,9)
    return randomnumber
end
function choose()
    local luck = math.random(1,2)
    if luck == 1 then
        return grl()
    elseif luck == 2 then
        return grn()
    end
end
function fivesymbols()
    return ""..choose()..""..choose()..""..choose()..""..choose()..""..choose()..""
end
function generatedcode()
    return ""..fivesymbols().."-"..fivesymbols().."-"..fivesymbols()..""
end
local requested = generatedcode()
setclipboard(tostring(requested))
