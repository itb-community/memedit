
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local inheritClass = utils.inheritClass
local missionBoardExists = utils.missionBoardExists
local scans = {}


scans.resist = inheritClass(Scan, {
	id = "Resist",
	name = "Game Resist",
	prerequisiteScans = {"vital.size_game"},
	access = "RW",
	dataType = "int",
	condition = missionBoardExists,
	action = function(self)
		if GAME.memedit == nil then
			GAME.memedit = {}
		end

		if GAME.memedit.resist == nil then
			GAME.memedit.resist = 0
		else
			local power = Game:GetPower()
			local diff = power:GetMax() - power:GetValue()

			while diff > 0 do
				diff = diff - 1
				Game:ModifyPowerGrid(SERIOUSLY_JUST_ONE)
			end

			Game:ModifyPowerGrid(SERIOUSLY_JUST_ONE)

			if GAME.memedit.resist < 10 then
				GAME.memedit.resist = GAME.memedit.resist + 2
			elseif GAME.memedit.resist < 25 then
				GAME.memedit.resist = GAME.memedit.resist + 1
			end
		end

		self:searchGame(GAME.memedit.resist)
		self:evaluateResults()
	end
})

return scans
