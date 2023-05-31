exports("getCurrentLocale", GetCurrentLocale)
exports("getCurrentLanguage", GetCurrentLanguage)

local function initialize()
    local language = GetCurrentLanguage()
    TriggerServerEvent("simpleLocale:setClientKnownLanguage", language)
end

Citizen.CreateThread(initialize)
