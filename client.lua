function GetLocale()
    return Locale
end

function GetLanguage()
    return Language
end

exports("getLocale", GetLocale)
exports("getLanguage", GetLanguage)

local function initialize()
    local language = GetCurrentLanguage()
    TriggerServerEvent("simpleLocale:setClientKnownLanguage", language)
end

Citizen.CreateThread(initialize)
