
function onPawnClassInitialized(BoardPawn, pawn)

	BoardPawn.AddWeaponVanilla = pawn.AddWeapon
	BoardPawn.AddWeapon = function(self, weaponId)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("string", type(weaponId), "Argument #1")
		Assert.Equals({"nil", "boolean"}, type(forceActive), "Argument #2")

		local memedit = memedit:get()
		if memedit then
			local weapon = _G[weaponId]

			if weapon then
				try(function()
					local origPowerCost = weapon.PowerCost
					local weaponIndex = self:GetWeaponCount() + 1

					weapon.PowerCost = 0

					self:AddWeaponVanilla(weaponId)
					self:SetWeaponClass(weaponIndex, weapon.Class)

					weapon.PowerCost = origPowerCost
				end)
				:catch(function(err)
					error(string.format(
							"memedit.dll: %s",
							tostring(err)
					))
				end)

				return
			end
		end

		self:AddWeaponVanilla(weaponId)
	end

	BoardPawn.GetClass = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getClass(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetCustomAnim = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getCustomAnim(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetDefaultFaction = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getDefaultFaction(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetImageOffset = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getImageOffset(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetImpactMaterial = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getImpactMaterial(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetLeader = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getLeader(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetMaxBaseHealth = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getBaseMaxHealth(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetMaxHealth = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getMaxHealth(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetOwner = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getOwner(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetQueuedTarget = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			local memedit = memedit:require()
			result = Point(
				memedit.pawn.getQueuedTargetX(self),
				memedit.pawn.getQueuedTargetY(self)
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

	BoardPawn.GetUndoLoc = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			local memedit = memedit:require()
			result = Point(
				memedit.pawn.getUndoX(self),
				memedit.pawn.getUndoY(self)
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

	BoardPawn.GetWeaponBaseType = function(self, weaponIndex)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(weaponIndex), "Argument #1")

		local result

		try(function()
			result = memedit:require().pawn.getWeaponBaseType(self, weaponIndex)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetWeaponClass = function(self, weaponIndex)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(weaponIndex), "Argument #1")

		local result

		try(function()
			result = memedit:require().pawn.getWeaponClass(self, weaponIndex)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetWeaponCount = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.getWeaponCount(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.GetWeaponType = function(self, weaponIndex)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(weaponIndex), "Argument #1")

		local result

		try(function()
			result = memedit:require().pawn.getWeaponType(self, weaponIndex)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsInvisible = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isInvisible(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsMassive = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isMassive(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsMinor = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isMinor(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsMissionCritical = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isMissionCritical(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsMovementSpent = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isMovementSpent(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsNeutral = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isNeutral(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.IsPushable = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		return not self:IsGuarding()
	end

	BoardPawn.IsSpaceColor = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local result

		try(function()
			result = memedit:require().pawn.isSpaceColor(self)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)

		return result
	end

	BoardPawn.RemoveWeapon = function(self, weaponIndex)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(weaponIndex), "Argument #1")

		try(function()
			memedit:require().pawn.removeWeapon(self, weaponIndex)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetBoosted = function(self, boosted)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(boosted), "Argument #1")

		try(function()
			memedit:require().pawn.setBoosted(self, boosted)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetClass = function(self, class)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("string", type(class), "Argument #1")

		try(function()
			memedit:require().pawn.setClass(self, class)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetCorpse = function(self, corpse)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(corpse), "Argument #1")

		try(function()
			memedit:require().pawn.setCorpse(self, corpse)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetDefaultFaction = function(self, faction)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(faction), "Argument #1")

		try(function()
			memedit:require().pawn.setDefaultFaction(self, faction)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetFlying = function(self, flying)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(flying), "Argument #1")

		try(function()
			memedit:require().pawn.setFlying(self, flying)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetId = function(self, id)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(id), "Argument #1")

		try(function()
			memedit:require().pawn.setId(self, id)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetImageOffset = function(self, imageOffset)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(imageOffset), "Argument #1")

		try(function()
			memedit:require().pawn.setImageOffset(self, imageOffset)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetImpactMaterial = function(self, impactMaterial)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(impactMaterial), "Argument #1")

		try(function()
			memedit:require().pawn.setImpactMaterial(self, impactMaterial)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetJumper = function(self, jumper)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(jumper), "Argument #1")

		try(function()
			memedit:require().pawn.setJumper(self, jumper)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetLeader = function(self, leader)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(leader), "Argument #1")

		try(function()
			memedit:require().pawn.setLeader(self, leader)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMassive = function(self, massive)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(massive), "Argument #1")

		try(function()
			memedit:require().pawn.setMassive(self, massive)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMaxBaseHealth = function(self, maxBaseHealth)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(maxBaseHealth), "Argument #1")

		try(function()
			memedit:require().pawn.setBaseMaxHealth(self, maxBaseHealth)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMaxHealth = function(self, maxHealth)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(maxHealth), "Argument #1")

		try(function()
			memedit:require().pawn.setMaxHealth(self, maxHealth)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMinor = function(self, minor)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(minor), "Argument #1")

		try(function()
			memedit:require().pawn.setMinor(self, minor)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMovementSpent = function(self, movementSpent)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(movementSpent), "Argument #1")

		try(function()
			memedit:require().pawn.setMovementSpent(self, movementSpent)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetMoveSpeed = function(self, moveSpeed)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(moveSpeed), "Argument #1")

		try(function()
			memedit:require().pawn.setMoveSpeed(self, moveSpeed)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetOwner = function(self, ownerId)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(ownerId), "Argument #1")

		try(function()
			memedit:require().pawn.setOwner(self, ownerId)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetPushable = function(self, pushable)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(pushable), "Argument #1")

		try(function()
			memedit:require().pawn.setPushable(self, pushable)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetQueuedTarget = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		try(function()
			local memedit = memedit:require()
			memedit.pawn.setQueuedTargetX(self, loc.x)
			memedit.pawn.setQueuedTargetY(self, loc.y)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetSpaceColor = function(self, spaceColor)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(spaceColor), "Argument #1")

		try(function()
			memedit:require().pawn.setSpaceColor(self, spaceColor)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetTeleporter = function(self, teleporter)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(teleporter), "Argument #1")

		try(function()
			memedit:require().pawn.setTeleporter(self, teleporter)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetUndoLoc = function(self, loc)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.TypePoint(loc, "Argument #1")

		try(function()
			local memedit = memedit:require()
			memedit.pawn.setUndoX(self, loc.x)
			memedit.pawn.setUndoY(self, loc.y)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	BoardPawn.SetWeaponClass = function(self, weaponIndex, class)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("number", type(weaponIndex), "Argument #1")
		Assert.Equals("string", type(class), "Argument #2")

		try(function()
			memedit:require().pawn.setWeaponClass(self, weaponIndex, class)
		end)
		:catch(function(err)
			error(string.format(
					"memedit.dll: %s",
					tostring(err)
			))
		end)
	end

	-- Vanilla IsJumping checks if the unit type definition
	-- has Jumper == true, instead of checking the class instance.
	BoardPawn.IsJumperVanilla = pawn.IsJumper
	BoardPawn.IsJumper = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local memedit = memedit:get()
		if memedit then
			local result

			try(function()
				result = memedit.pawn.isJumper(self)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return result
		end

		return self:IsJumperVanilla()
	end

	-- Vanilla IsTeleporter checks if the unit type definition
	-- has Teleporter == true, instead of checking the class instance.
	BoardPawn.IsTeleporterVanilla = pawn.IsTeleporter
	BoardPawn.IsTeleporter = function(self)
		Assert.Equals("userdata", type(self), "Argument #0")

		local memedit = memedit:get()
		if memedit then
			local result

			try(function()
				result = memedit.pawn.isTeleporter(self)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return result
		end

		return self:IsTeleporterVanilla()
	end

	-- Board.SetSmoke has two parameter. Param #2 allows setting
	-- smoke without an animation. Add this functionality to
	-- Pawn.SetAcid.
	BoardPawn.SetAcidVanilla = pawn.SetAcid
	BoardPawn.SetAcid = function(self, acid, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(acid), "Argument #1")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #2")

		local memedit = memedit:get()
		if memedit and skipAnimation then
			try(function()
				memedit.pawn.setAcid(self, acid)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetAcidVanilla(acid)
	end

	-- Board.SetSmoke has two parameter. Param #2 allows setting
	-- smoke without an animation. Add this functionality to
	-- Pawn.SetFrozen.
	BoardPawn.SetFrozenVanilla = pawn.SetFrozen
	BoardPawn.SetFrozen = function(self, frozen, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(frozen), "Argument #1")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #2")

		local memedit = memedit:get()
		if memedit and skipAnimation then
			try(function()
				memedit.pawn.setFrozen(self, frozen)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetFrozenVanilla(frozen)
	end

	-- Vanilla Setmech can only set mech to true, not false.
	BoardPawn.SetMechVanilla = pawn.SetMech
	BoardPawn.SetMech = function(self, mech)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals({"nil", "boolean"}, type(mech), "Argument #1")

		local memedit = memedit:get()
		if memedit and mech ~= nil then
			try(function()
				memedit.pawn.setMech(self, mech)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetMechVanilla()
	end

	-- With the addition of Board.IsNeutral,
	-- mod loader's Board.SetNeutral is no longer needed.
	-- Revert mod loader's function override
	if BoardPawn.SetNeutralVanilla then
		BoardPawn.SetNeutral = BoardPawn.SetNeutralVanilla
		BoardPawn.SetNeutralVanilla = nil
	end

	-- Board.SetSmoke has two parameter. Param #2 allows setting
	-- smoke without an animation. Add this functionality to
	-- Pawn.SetShield.
	BoardPawn.SetShieldVanilla = pawn.SetShield
	BoardPawn.SetShield = function(self, shield, skipAnimation)
		Assert.Equals("userdata", type(self), "Argument #0")
		Assert.Equals("boolean", type(shield), "Argument #1")
		Assert.Equals({"nil", "boolean"}, type(skipAnimation), "Argument #2")

		local memedit = memedit:get()
		if memedit and skipAnimation then
			try(function()
				memedit.pawn.setShield(self, shield)
			end)
			:catch(function(err)
				error(string.format(
						"memedit.dll: %s",
						tostring(err)
				))
			end)

			return
		end

		self:SetShieldVanilla(shield)
	end
end

modApi.events.onPawnClassInitialized:subscribe(onPawnClassInitialized)
