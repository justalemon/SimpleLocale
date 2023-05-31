local name = GetCurrentResourceName()

function Debug(message)
    if GetConvarInt(name .. "_debug", 0) == 0 then
        return
    end

    print(message)
end

function Split(input, sep)
    if sep == nil then
        sep = "%s"
    end

    local t = {}

    for str in string.gmatch(input, "([^"..sep.."]+)") do
        t[#t + 1] = str
    end

    return t
end
