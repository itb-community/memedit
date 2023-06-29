
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local inheritClass = utils.inheritClass
local boardExists = utils.boardExists
local requireScanMovePlayerPawn = utils.requireScanMovePlayerPawn
local cleanupScanMovePawn = utils.cleanupScanMovePawn
local prepareScanPawn = utils.prepareScanPawn
local randomCleanPoint = utils.randomCleanPoint
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

scans.attackOrder = inheritClass(Scan, {
	id = "AttackOrder",
	name = "Board Attack Order",
	prerequisiteScans = {"vital.size_board"},
	access = "R",
	dataType = "int",
	condition = function()
		if Board == nil or GetCurrentMission() == nil then
			return false, "Enter a mission"
		elseif Board:IsMissionBoard() == nil then
			return false, "Enter a real mission"
		elseif Game:GetTeamTurn() ~= TEAM_PLAYER then
			return false, "Wait for player's turn..."
		else
			return true
		end
	end,
	cleanup = function(self)
		if self.data then
			if Board then
				if self.data.regenPsionId then
					Board:RemovePawn(Board:GetPawn(self.data.regenPsionId))
				end
				if self.data.simpleEnemyId then
					Board:RemovePawn(Board:GetPawn(self.data.simpleEnemyId))
				end
			end
			self.data = nil
		end
	end,
	actions = {
		function(self)
			-- This scan will keep track of two units - a regen psion and a simple enemy.
			-- The regen psion will be on fire, while the simple enemy will start damaged.
			--
			-- We will use the following assumptions as a basis to find which phase in the
			-- attack order we are currently in.
			--
			-- While the board is busy:
			--     If the regen psion loses life, it must be because of fire.
			--     If the simple enemy gains life, it must be because of regeneration.
			if self.data == nil then
				self.data = {}
			end
			-- Ensure that the two units we need exists
			if self.data.regenPsionId then
				self.data.regenPsion = Board:GetPawn(self.data.regenPsionId)
			end
			if self.data.simpleEnemyId then
				self.data.simpleEnemy = Board:GetPawn(self.data.simpleEnemyId)
			end
			-- Create the regen psion if it does not exist
			if self.data.regenPsion == nil then
				prepareScanPawn{
					Health = 2,
					Image = "jelly",
					MoveSpeed = 0,
					DefaultTeam = TEAM_ENEMY,
					Flying = true,
					Leader = LEADER_REGEN,
				}
				self.data.regenPsion = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
				self.data.regenPsionId = self.data.regenPsion:GetId()
				Board:AddPawn(self.data.regenPsion, randomCleanPoint())
				self.data.regenPsionHealth = self.data.regenPsion:GetHealth()
			end
			-- Create the simple enemy if it does not exist
			if self.data.simpleEnemy == nil then
				prepareScanPawn{
					Health = 2,
					Image = "jelly",
					MoveSpeed = 0,
					DefaultTeam = TEAM_ENEMY,
					Flying = true,
				}
				self.data.simpleEnemy = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
				self.data.simpleEnemyId = self.data.simpleEnemy:GetId()
				local loc = randomCleanPoint()
				Board:AddPawn(self.data.simpleEnemy, loc)
				Board:DamageSpace(SpaceDamage(loc, 1))
				self.data.simpleEnemyHealth = self.data.simpleEnemy:GetHealth()
			end
			if not Board:IsBusy() then
				-- While the board is not busy:
				-- Kill all enemies that we are not watching
				for _, pawnId in ipairs(extract_table(Board:GetPawns(TEAM_ENEMY))) do
					if true
						and pawnId ~= self.data.regenPsionId
						and pawnId ~= self.data.simpleEnemyId
					then
						Board:GetPawn(pawnId):Kill()
					end
				end
				if not self.data.regenPsion:IsFire() then
					Board:SetFire(self.data.regenPsion:GetSpace(), true)
				end

				self:searchBoard(ATTACK_ORDER_IDLE)
				self:evaluateResults()
				self.instruction = "Press 'end turn'"
			else
				-- While the board is busy:
				-- Monitor the watched pawns for changes in health to detect the current phase in the attack order.
				if self.data.regenPsion:GetHealth() < self.data.regenPsionHealth then
					self.data.regenPsionHealth = self.data.regenPsion:GetHealth()
					self:searchBoard(ATTACK_ORDER_FIRE)
					self:evaluateResults()
				elseif self.data.simpleEnemy:GetHealth() > self.data.simpleEnemyHealth then
					self.data.simpleEnemyHealth = self.data.simpleEnemy:GetHealth()
					self:searchBoard(ATTACK_ORDER_REGENERATION)
				end
			end
		end,
	}
})

return scans
