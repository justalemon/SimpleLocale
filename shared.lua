local name = GetCurrentResourceName()

function Debug(message)
    if GetConvarInt(name .. "_debug", 0) == 0 then
        return
    end

    print(message)
end
