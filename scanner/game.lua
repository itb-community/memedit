
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
		local mission = GetCurrentMission()

		if mission.memedit == nil then
			mission.memedit = {}
		end

		if mission.memedit.resist == nil then
			mission.memedit.resist = 0
		else
			local power = Game:GetPower()
			local diff = power:GetMax() - power:GetValue()

			while diff > 0 do
				diff = diff - 1
				Game:ModifyPowerGrid(SERIOUSLY_JUST_ONE)
			end

			Game:ModifyPowerGrid(SERIOUSLY_JUST_ONE)

			if mission.memedit.resist < 10 then
				mission.memedit.resist = mission.memedit.resist + 2
			elseif mission.memedit.resist < 25 then
				mission.memedit.resist = mission.memedit.resist + 1
			end
		end

		self:searchGame(mission.memedit.resist)
		self:evaluateResults()
	end
})

return scans
