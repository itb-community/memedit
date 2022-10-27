
local path = GetParentPath(...)
local english = require(path.."localization/english")

local function loadLanguage(languageIndex, oldLanguageIndex)
	-- Don't overwrite if the text might have been translated
	-- to the correct language by another mod
	local overwrite = languageIndex ~= Languages.English

	for id, text in pairs(english) do
		if overwrite or modApi.dictionary[id] == nil then
			modApi:setText(id, text)
		end
	end
end

loadLanguage(modApi:getLanguageIndex())
modApi.events.onLanguageChanged:subscribe(loadLanguage)
