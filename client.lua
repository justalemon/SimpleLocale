local function getCurrentLocale()
    return GetConvar("locale", "en-US")
end

local function getCurrentLanguage()
    local lang = Split(getCurrentLocale(), "-")[1]

    if lang == nil then
        return "en"
    else
        return lang
    end
end

exports("getCurrentLocale", getCurrentLocale)
exports("getCurrentLanguage", getCurrentLanguage)
