function GetLocale()
    return Locale
end

function GetLanguage()
    return Language
end

exports("getCurrentLocale", GetLocale)
exports("getCurrentLanguage", GetLanguage)

local function initialize()
    local language = GetCurrentLanguage()
    TriggerServerEvent("simpleLocale:setClientKnownLanguage", language)
end

Citizen.CreateThread(initialize)
