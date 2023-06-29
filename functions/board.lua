
local function onBoardClassInitialized(BoardClass, board)

	BoardClass.GetFireType = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return FIRE_TYPE_NONE
		end

		local result

		try(function()
			result = memedit:require().board.getFireType(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.GetHighlighted = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local memedit = memedit:get()
		if memedit then
			local result

			try(function()
				result = Point(
					memedit.board.getHighlightedX(),
					memedit.board.getHighlightedY()
				)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return result
		end

		if GetCurrentMission() == nil then
			return nil
		end

		return mouseTile()
	end

	BoardClass.GetAttackOrder = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().board.getAttackOrder()
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.GetMaxHealth = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return 0
		end

		local result

		try(function()
			result = memedit:require().board.getMaxHealth(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.GetRubbleType = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return RUBBLE_BUILDING
		end

		local result

		try(function()
			result = memedit:require().board.getRubbleType(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.GetTerrainIcon = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return ""
		end

		local result

		try(function()
			result = memedit:require().board.getTerrainIcon(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.GetUniqueBuilding = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return ""
		end

		local result

		try(function()
			result = memedit:require().board.getUniqueBuildingName(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.IsForest = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return false
		end

		local result

		try(function()
			local memedit = memedit:require()
			local fireType = memedit.board.getFireType(loc)
			local terrain = memedit.board.getTerrain(loc)

			result = false
				or terrain == TERRAIN_FOREST
				or fireType == FIRE_TYPE_FOREST_FIRE
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.IsForestFire = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return false
		end

		local result

		try(function()
			result = memedit:require().board.getFireType(loc) == FIRE_TYPE_FOREST_FIRE
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.IsHighlighted = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return false
		end

		local memedit = memedit:get()
		if memedit then
			local result

			try(function()
				result = memedit.board.isHighlighted(loc)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return result
		end

		if GetCurrentMission() == nil then
			return false
		end

		return loc == mouseTile()
	end

	BoardClass.IsShield = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return false
		end

		local result

		try(function()
			result = memedit:require().board.isShield(loc)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardClass.RemoveItem = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		if not self:IsValid(loc) then
			return false
		end

		try(function()
			result = memedit:require().board.setItem(loc, "")
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardClass.SetRubbleType = function(self, loc, rubbleType)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")
		Assert.Equals("number", type(rubbleType), "Argument #2")

		if not self:IsValid(loc) then
			return
		end

		try(function()
			memedit:require().board.setRubbleType(loc, rubbleType)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	-- SetSmoke has two parameter. Param #2 allows setting smoke
	-- without an animation. Add this functionality to SetShield.
	BoardClass.SetShield = function(self, loc, shield, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")
		Assert.Equals("boolean", type(shield), "Argument #2")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #3")

		if not self:IsValid(loc) then
			return
		end

		local memedit = memedit:get()
		if memedit and skipAnimation then
			try(function()
				local terrain = memedit.board.getTerrain(loc)
				local isShieldableTerrain = false
					or terrain == TERRAIN_MOUNTAIN
					or terrain == TERRAIN_BUILDING

				if isShieldableTerrain then
					memedit.board.setShield(loc, shield)
				else
					local pawn = self:GetPawn(loc)
					if pawn then
						pawn:SetShield(shield, skipAnimation)
					end
				end
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		if shield then
			self:AddShield(loc)
		else
			self:RemoveShield(loc)
		end
	end

	BoardClass.SetUniqueBuilding = function(self, loc, structureId)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")
		Assert.Equals("string", type(structureId), "Argument #2")

		if not self:IsValid(loc) then
			return
		end

		local terrains = { [loc.y * self:GetSize().x + loc.x + 1] = self:GetTerrain(loc) }
		local memedit = memedit:get()

		if structureId ~= "" then
			-- Change all buildings to roads
			for i, p in ipairs(self) do
				local terrain = self:GetTerrain(p)

				if terrain == TERRAIN_BUILDING then
					terrains[i] = terrain
					self:SetTerrain(p, TERRAIN_ROAD)
				end
			end
		end

		if memedit then
			try(function()
				memedit.board.setUniqueBuildingName(loc, "")
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)
		end

		if structureId ~= "" then
			-- Create a single building so it is the only one
			-- that can be converted to a unique building
			self:SetTerrain(loc, TERRAIN_ROAD)
			self:SetTerrain(loc, TERRAIN_BUILDING)
			self:AddUniqueBuilding(structureId)

			-- Revart all buildings back to buildings
			for i, p in ipairs(self) do
				if terrains[i] then
					self:SetTerrain(p, terrains[i])
				end
			end
		end
	end

	-- SetSmoke has two parameter. Param #2 allows setting smoke
	-- without an animation. Add this functionality to SetAcid.
	BoardClass.SetAcidVanilla = board.SetAcid
	BoardClass.SetAcid = function(self, loc, acid, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")
		Assert.Equals("boolean", type(acid), "Argument #2")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #3")

		local memedit = memedit:get()
		if memedit and skipAnimation and self:IsValid(loc) then
			try(function()
				memedit.board.setAcid(loc, acid)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetAcidVanilla(loc, acid)
	end

	-- SetSmoke has two parameter. Param #2 allows setting smoke
	-- without an animation. Add this functionality to SetFrozen.
	BoardClass.SetFrozenVanilla = board.SetFrozen
	BoardClass.SetFrozen = function(self, loc, frozen, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")
		Assert.Equals("boolean", type(frozen), "Argument #2")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #3")

		local memedit = memedit:get()
		if memedit and skipAnimation and self:IsValid(loc) then
			try(function()
				local terrain = memedit.board.getTerrain(loc)
				local customTile = self:GetCustomTile(loc)
				local fireType = memedit.board.getFireType(loc)
				local isFreezableTerrain = false
					or terrain == TERRAIN_MOUNTAIN
					or terrain == TERRAIN_BUILDING

				if frozen then
					if customTile == "" then
						self:SetCustomTile(loc, "snow.png")
					end

					if fireType ~= FIRE_TYPE_NONE then
						memedit.board.setFireType(loc, FIRE_TYPE_NONE)
					end
				end

				if isFreezableTerrain then
					memedit.board.setFrozen(loc, frozen)
				else
					local pawn = self:GetPawn(loc)
					if pawn then
						pawn:SetFrozen(frozen, skipAnimation)
					end
				end
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetFrozenVanilla(loc, frozen)
	end
end

modApi.events.onBoardClassInitialized:subscribe(onBoardClassInitialized)
