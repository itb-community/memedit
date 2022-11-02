local testsuite = Tests.Testsuite()
testsuite.name = "Memedit-generated-weapon-functions tests"
Testsuites["weapon-memedit"] = testsuite


testsuite.test_weapon_list = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponList = memedit.dll.pawn.getWeaponList(pawn)

	Assert.Equals("userdata", type(weaponList))
	Assert.Equals(#PunchMech.SkillList, weaponList:size() - 1)

	return true
end

testsuite.test_power_list = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("DeploySkill_Tank")
	local powerList = memedit.dll.weapon.getPowerList(pawn, weaponIndex)

	Assert.Equals("userdata", type(powerList))
	Assert.Equals(DeploySkill_Tank.PowerCost, powerList:size())

	return true
end

testsuite.test_upgrade_list_a = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("DeploySkill_Tank")
	local powerList = memedit.dll.weapon.getUpgradeListA(pawn, weaponIndex)

	Assert.Equals("userdata", type(powerList))
	Assert.Equals(DeploySkill_Tank.UpgradeCost[1], powerList:size())

	return true
end

testsuite.test_upgrade_list_a = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("DeploySkill_Tank")
	local powerList = memedit.dll.weapon.getUpgradeListB(pawn, weaponIndex)

	Assert.Equals("userdata", type(powerList))
	Assert.Equals(DeploySkill_Tank.UpgradeCost[2], powerList:size())

	return true
end

testsuite.test_power_cost = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("DeploySkill_Tank")
	local powerCost = memedit.dll.weapon.getPowerCost(pawn, weaponIndex)

	Assert.Equals(DeploySkill_Tank.PowerCost, powerCost)

	return true
end

testsuite.test_base_type = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weapon = DeploySkill_Tank
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("DeploySkill_Tank")
	local baseType = memedit.dll.weapon.getBaseType(pawn, weaponIndex)

	Assert.Equals("DeploySkill_Tank", baseType)

	return true
end

testsuite.test_class = function()
	Tests.RequireMemedit()
	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local weaponIndex = #PunchMech.SkillList + 1
	pawn:AddWeapon("Brute_Jetmech")
	local class = memedit.dll.weapon.getClass(pawn, weaponIndex)

	-- When adding a weapon to a pawn, the weapon's class
	-- is set to be the same as the pawn's class.
	Assert.Equals(PunchMech.Class, class)

	return true
end
