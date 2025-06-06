function randomsymbol()
    local rndm = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$_&-+()*':;!?,.[]{}=|~`•"
    local rndmindex = math.random(1, #rndm)
    return rndm:sub(rndmindex,rndmindex)
end
