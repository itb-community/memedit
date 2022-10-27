local testsuite = Testsuites.pawn
if testsuite == nil then
	testsuite = Tests.Testsuite()
	testsuite.name = "Pawn-related tests"
	Testsuites.pawn = testsuite
end


testsuite.test_Pawn_Acid = function()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local skipAnimation = true

	pawn:SetAcid(true, skipAnimation)
	Assert.Equals(true, pawn:IsAcid())

	return true
end

testsuite.test_Pawn_Boosted = function()
	local memedit = memedit:get()

	if memedit then
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(false, pawn:IsBoosted())

		pawn:SetBoosted(true)
		Assert.Equals(true, pawn:IsBoosted())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.Equals(false, pawn:IsBoosted())
		Assert.ShouldError(pawn.SetBoosted, {pawn, true}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Corpse = function()
	local memedit = memedit:get()

	if memedit then
		local corpse = Spiderling1.Corpse
		local pawn = PAWN_FACTORY:CreatePawn("Spiderling1")

		pawn:SetCorpse(true)
		Assert.Equals(true, pawn:IsCorpse())
	else
		local pawn = PAWN_FACTORY:CreatePawn("Spiderling1")
		Assert.ShouldError(pawn.SetCorpse, {pawn, true}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Class = function()
	local memedit = memedit:get()

	if memedit then
		local class = TeleMech.Class
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")

		Assert.Equals(class, pawn:GetClass())

		pawn:SetClass("Ranged")
		Assert.Equals("Ranged", pawn:GetClass())
	else
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")
		Assert.ShouldError(pawn.GetClass, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetClass, {pawn, "Ranged"}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_CustomAnim = function()
	local memedit = memedit:get()

	if memedit then
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")
	
		pawn:SetCustomAnim("testAnim")
		Assert.Equals("testAnim", pawn:GetCustomAnim())
	else
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")
		Assert.ShouldError(pawn.GetCustomAnim, {pawn}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_DefaultFaction = function()
	local memedit = memedit:get()

	if memedit then
		local defaultFaction = Snowtank1.DefaultFaction
		local pawn = PAWN_FACTORY:CreatePawn("Snowtank1")

		Assert.Equals(defaultFaction, pawn:GetDefaultFaction())

		pawn:SetDefaultFaction(FACTION_DEFAULT)
		Assert.Equals(FACTION_DEFAULT, pawn:GetDefaultFaction())
	else
		local pawn = PAWN_FACTORY:CreatePawn("Snowtank1")
		Assert.ShouldError(pawn.GetDefaultFaction, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetDefaultFaction, {pawn, FACTION_DEFAULT}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Flying = function()
	local memedit = memedit:get()

	if memedit then
		local flying = PunchMech.Flying
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(flying, pawn:IsFlying())

		pawn:SetFlying(true)
		Assert.Equals(true, pawn:IsFlying())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.SetFlying, {pawn, true}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Frozen = function()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local skipAnimation = true

	pawn:SetFrozen(true, skipAnimation)
	Assert.Equals(true, pawn:IsFrozen())

	return true
end

testsuite.test_Pawn_ImageOffset = function()
	local memedit = memedit:get()

	if memedit then
		local imageOffset = TeleMech.ImageOffset
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")

		Assert.Equals(imageOffset, pawn:GetImageOffset())

		pawn:SetImageOffset(13)
		Assert.Equals(13, pawn:GetImageOffset())
	else
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")
		Assert.ShouldError(pawn.GetImageOffset, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetImageOffset, {pawn, 13}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_ImpactMaterial = function()
	local memedit = memedit:get()

	if memedit then
		local impactMaterial = TeleMech.ImpactMaterial
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")

		Assert.Equals(impactMaterial, pawn:GetImpactMaterial())

		pawn:SetImpactMaterial(IMPACT_INSECT)
		Assert.Equals(IMPACT_INSECT, pawn:GetImpactMaterial())
	else
		local pawn = PAWN_FACTORY:CreatePawn("TeleMech")
		Assert.ShouldError(pawn.GetImpactMaterial, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetImpactMaterial, {pawn, IMPACT_INSECT}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Invisible = function()
	local memedit = memedit:get()

	if memedit then
		local invisible = false
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(invisible, pawn:IsInvisible())

		pawn:SetInvisible(true)
		Assert.Equals(true, pawn:IsInvisible())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.IsInvisible, {pawn}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Jumper = function()
	local memedit = memedit:get()

	if memedit then
		local jumper = PunchMech.Jumper
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(jumper, pawn:IsJumper())

		pawn:SetJumper(true)
		Assert.Equals(true, pawn:IsJumper())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.Equals(false, pawn:IsJumper())
		Assert.ShouldError(pawn.SetJumper, {pawn, true}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Leader = function()
	local memedit = memedit:get()

	if memedit then
		local leader = Jelly_Health1.Leader
		local pawn = PAWN_FACTORY:CreatePawn("Jelly_Health1")

		Assert.Equals(leader, pawn:GetLeader())

		pawn:SetLeader(LEADER_ARMOR)
		Assert.Equals(LEADER_ARMOR, pawn:GetLeader())
	else
		local pawn = PAWN_FACTORY:CreatePawn("Jelly_Health1")
		Assert.ShouldError(pawn.GetLeader, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetLeader, {pawn, LEADER_ARMOR}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Massive = function()
	local memedit = memedit:get()

	if memedit then
		local massive = PunchMech.Massive
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(massive, pawn:IsMassive())

		pawn:SetMassive(false)
		Assert.Equals(false, pawn:IsMassive())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.IsMassive, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetMassive, {pawn, false}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_MaxBaseHealth = function()
	local memedit = memedit:get()

	if memedit then
		local maxBaseHealth = PunchMech.Health
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(maxBaseHealth, pawn:GetMaxBaseHealth())

		pawn:SetMaxBaseHealth(7)
		Assert.Equals(7, pawn:GetMaxBaseHealth())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.GetMaxBaseHealth, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetMaxBaseHealth, {pawn, 7}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_MaxHealth = function()
	local memedit = memedit:get()

	if memedit then
		local maxHealth = PunchMech.Health
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(maxHealth, pawn:GetMaxHealth())

		pawn:SetMaxHealth(7)
		Assert.Equals(7, pawn:GetMaxHealth())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.GetMaxHealth, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetMaxHealth, {pawn, 7}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Mech = function()
	local pawn = PAWN_FACTORY:CreatePawn("Spiderling1")

	-- Though a dangerous function to use,
	-- it does not cause any problems as long
	-- as we never add the unit to the board.
	-- The game only gets into problems when
	-- there are a different amount than 3
	-- mechs on the board at the same time.
	pawn:SetMech(true)
	Assert.Equals(true, pawn:IsMech())

	return true
end

testsuite.test_Pawn_Minor = function()
	local memedit = memedit:get()

	if memedit then
		local minor = Spiderling1.Minor
		local pawn = PAWN_FACTORY:CreatePawn("Spiderling1")

		Assert.Equals(minor, pawn:IsMinor())

		pawn:SetMinor(false)
		Assert.Equals(false, pawn:IsMinor())
	else
		local pawn = PAWN_FACTORY:CreatePawn("Spiderling1")
		Assert.ShouldError(pawn.IsMinor, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetMinor, {pawn, false}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_MissionCritical = function()
	local memedit = memedit:get()

	if memedit then
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		pawn:SetMissionCritical(true)
		Assert.Equals(true, pawn:IsMissionCritical())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.IsMissionCritical, {pawn}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_MoveSpeed = function()
	local memedit = memedit:get()

	if memedit then
		local moveSpeed = PunchMech.MoveSpeed
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(moveSpeed, pawn:GetMoveSpeed())

		pawn:SetMoveSpeed(7)
		Assert.Equals(7, pawn:GetMoveSpeed())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.SetMoveSpeed, {pawn, 7}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Neutral = function()
	local memedit = memedit:get()

	if memedit then
		local neutral = RockThrown.Neutral
		local pawn = PAWN_FACTORY:CreatePawn("RockThrown")

		Assert.Equals(neutral, pawn:IsNeutral())

		pawn:SetNeutral(false)
		Assert.Equals(false, pawn:IsNeutral())
	else
		local pawn = PAWN_FACTORY:CreatePawn("RockThrown")
		Assert.ShouldError(pawn.IsNeutral, {pawn}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Pushable = function()
	local memedit = memedit:get()

	if memedit then
		local pushable = PunchMech.Pushable
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(pushable, pawn:IsPushable())

		pawn:SetPushable(false)
		Assert.Equals(false, pawn:IsPushable())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.Equals(true, pawn:IsPushable())
		Assert.ShouldError(pawn.SetPushable, {pawn, false}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Shield = function()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local skipAnimation = true

	pawn:SetShield(true, skipAnimation)
	Assert.Equals(true, pawn:IsShield())

	return true
end

testsuite.test_Pawn_SpaceColor = function()
	local memedit = memedit:get()

	if memedit then
		local spaceColor = PunchMech.SpaceColor
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(spaceColor, pawn:IsSpaceColor())

		pawn:SetSpaceColor(false)
		Assert.Equals(false, pawn:IsSpaceColor())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.IsSpaceColor, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetSpaceColor, {pawn, false}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Owner = function()
	local memedit = memedit:get()

	if memedit then
		-- This test could be rewritten to have the unit
		-- use a weapon to create a unit we know will be
		-- owner by the shooter, but this simple variant
		-- will also detect if the functions are not
		-- working as expected.
		local owner = -1
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(owner, pawn:GetOwner())

		pawn:SetOwner(7)
		Assert.Equals(7, pawn:GetOwner())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.GetOwner, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetOwner, {pawn, 7}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_QueuedTarget = function()
	local memedit = memedit:get()

	if memedit then
		-- This test could be rewritten to have the unit
		-- queue up an attack with known queued target,
		-- but this simple variant will also detect if
		-- the functions are not working as expected.
		local queuedTarget = Point(-1,-1)
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.True(queuedTarget == pawn:GetQueuedTarget())

		pawn:SetQueuedTarget(Point(7,7))
		Assert.True(Point(7,7) == pawn:GetQueuedTarget())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.ShouldError(pawn.GetQueuedTarget, {pawn}, "Function should fail without memedit")
		Assert.ShouldError(pawn.SetQueuedTarget, {pawn, Point(7,7)}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_Pawn_Teleporter = function()
	local memedit = memedit:get()

	if memedit then
		local teleporter = PunchMech.Teleporter
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")

		Assert.Equals(teleporter, pawn:IsTeleporter())

		pawn:SetTeleporter(true)
		Assert.Equals(true, pawn:IsTeleporter())
	else
		local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
		Assert.Equals(false, pawn:IsTeleporter())
		Assert.ShouldError(pawn.SetTeleporter, {pawn, true}, "Function should fail without memedit")
	end

	return true
end

return pawn
