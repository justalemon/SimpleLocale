function Debug(message)
    if GetConvarInt("simplepassive_debug", 0) == 0 then
        return
    end

    print(message)
end
