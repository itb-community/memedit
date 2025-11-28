
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

scans.money = inheritClass(Scan, {
	id = "Money",
	name = "Game Reputation (Money)",
	prerequisiteScans = {"vital.size_game"},
	access = "RW",
	dataType = "int",
	condition = function() 
		if SquadData == nil then
			return false, "Enter a Game"
		elseif GAME.memedit == nil or GAME.memedit.money == nil then
			-- If its not set yet, we can do our first pass
			return true
		elseif GAME.memedit.money == SquadData.money then
			-- Only scan again once its changed. This is crucial to 
			-- prevent scanning prematurely where the money in memory 
			-- may be updated already but not the squad data
			-- Note because we get the actual value from SquadData, we
			-- need something that will trigger it to be refreshed. The
			-- money cmd unfortunately does not do this
			return false, "Earn more reputation ('money' cmd won't work)"
		end
		return true
	end,
	action = function(self)
		if GAME.memedit == nil then
			GAME.memedit = {}
		end
		GAME.memedit.money = SquadData.money
		self:searchGame(GAME.memedit.money)
		self:evaluateResults()
	end
})

return scans
