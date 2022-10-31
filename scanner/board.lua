
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local inheritClass = utils.inheritClass
local boardExists = utils.boardExists
local requireScanMovePlayerPawn = utils.requireScanMovePlayerPawn
local cleanupScanMovePawn = utils.cleanupScanMovePawn
local scans = {}

scans.highlightedX = inheritClass(Scan, {
	id = "HighlightedX",
	name = "Board HighlightedX",
	prerequisiteScans = {"vital.size_board", "pawn.MovementSpent"},
	access = "R",
	dataType = "int",
	condition = boardExists,
	cleanup = function(self)
		cleanupScanMovePawn()
		if memedit_scanMove.Caller == self then
			memedit_scanMove:TeardownEvent()
		end
	end,
	actions = {
		function(self)
			local pawn, waitInstruction = requireScanMovePlayerPawn()

			if self.iteration == 1 then
				memedit_scanMove:SetEvents{
					TargetEvent = self.onMoveHighlighted,
					AfterEffectEvent = self.afterMoveEffect,
					Caller = self,
				}
			end

			if pawn then
				self.instruction = "Hover tiles with the provided ScanPawn's Move skill"
			else
				self.instruction = waitInstruction
			end
		end
	},
	onMoveHighlighted = function(self, pawn, p1, p2)
		self:searchBoard(p2.x)
		self:evaluateResults()
	end,
	afterMoveEffect = function(self, pawn, p1, p2)
		memedit.dll.pawn.setMovementSpent(pawn, false)
	end,
})

scans.highlightedY = inheritClass(Scan, {
	id = "HighlightedY",
	name = "Board HighlightedY",
	prerequisiteScans = {"vital.size_board", "pawn.MovementSpent"},
	access = "R",
	dataType = "int",
	condition = boardExists,
	cleanup = function(self)
		cleanupScanMovePawn()
		if memedit_scanMove.Caller == self then
			memedit_scanMove:TeardownEvent()
		end
	end,
	actions = {
		function(self)
			local pawn, waitInstruction = requireScanMovePlayerPawn()

			if self.iteration == 1 then
				memedit_scanMove:SetEvents{
					TargetEvent = self.onMoveHighlighted,
					AfterEffectEvent = self.afterMoveEffect,
					Caller = self,
				}
			end

			if pawn then
				self.instruction = "Hover tiles with the provided ScanPawn's Move skill"
			else
				self.instruction = waitInstruction
			end
		end
	},
	onMoveHighlighted = function(self, pawn, p1, p2)
		self:searchBoard(p2.y)
		self:evaluateResults()
	end,
	afterMoveEffect = function(self, pawn, p1, p2)
		memedit.dll.pawn.setMovementSpent(pawn, false)
	end,
})

return scans
