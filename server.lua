local knownLanguages = {
    [0] = "en-US",
    [1] = "fr-FR",
    [2] = "de-DE",
    [3] = "it-IT",
    [4] = "es-ES",
    [5] = "pt-BR",
    [6] = "pl-PL",
    [7] = "ru-RU",
    [8] = "ko-KR",
    [9] = "zh-TW",
    [10] = "ja-JP",
    [11] = "es-MX",
    [12] = "zh-CN"
}
local clientLanguages = {}

local function setClientKnownLanguage(langId)
    if type(langId) ~= "number" then
        return
    end

    local language = knownLanguages[langId]

    if language == nil then
        Debug("Invalid lang id " .. tostring(langId) .. " for client " .. tostring(string) .. ", defaulting to en-US")
        language = "en-US"
    end

    clientLanguages[source] = language
    Debug("Received langId " .. language .. " for client " .. tostring(source))
end

RegisterNetEvent("simpleLocale:setClientKnownLanguage", setClientKnownLanguage)
