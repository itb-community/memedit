local testsuite = Testsuites.board
if testsuite == nil then
	testsuite = Tests.Testsuite()
	testsuite.name = "Board-related tests"
	Testsuites.board = testsuite
end


testsuite.test_GetFireType = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:ClearSpace(p)
		Board:SetFire(p, false)
		local fireType_None = Board:GetFireType(p)

		Board:ClearSpace(p)
		Board:SetFire(p, true)
		local fireType_NormalFire = Board:GetFireType(p)

		Board:ClearSpace(p)
		Board:SetTerrain(p, TERRAIN_FOREST)
		Board:SetFire(p, true)
		local fireType_ForestFire = Board:GetFireType(p)

		Assert.Equals(FIRE_TYPE_NONE, fireType_None)
		Assert.Equals(FIRE_TYPE_NORMAL_FIRE, fireType_NormalFire)
		Assert.Equals(FIRE_TYPE_FOREST_FIRE, fireType_ForestFire)

		Board:ClearSpace(p)
	else
		Assert.ShouldError(Board.GetFireType, {Board, p}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_GetTerrainIcon = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:SetTerrainIcon(p, "terrainIcon_Test")
		local terrainIcon_Test = Board:GetTerrainIcon(p)

		Board:SetTerrainIcon(p, "")
		local terrainIcon_None = Board:GetTerrainIcon(p)

		Assert.Equals("", terrainIcon_None)
		Assert.Equals("terrainIcon_Test", terrainIcon_Test)

		Board:SetTerrainIcon(p,"")
	else
		Assert.ShouldError(Board.GetTerrainIcon, {Board, p}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_IsForest = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:SetTerrain(p, TERRAIN_FOREST)
		local isForest = Board:IsForest(p)

		Board:SetTerrain(p, TERRAIN_ROAD)
		local isNotForest = not Board:IsForest(p)

		Assert.Equals(true, isForest)
		Assert.Equals(true, isNotForest)

		Board:ClearSpace(p)
	else
		Assert.ShouldError(Board.IsForest, {Board, p}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_IsForestFire = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:SetTerrain(p, TERRAIN_FOREST)
		Board:SetFire(p, true)
		local isForestFire = Board:IsForestFire(p)

		Board:ClearSpace(p)
		Board:SetTerrain(p, TERRAIN_ROAD)
		Board:SetFire(p, true)
		local isNotForestFire = not Board:IsForestFire(p)

		Assert.Equals(true, isForestFire)
		Assert.Equals(true, isNotForestFire)

		Board:ClearSpace(p)
	else
		Assert.ShouldError(Board.IsForestFire, {Board, p}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_IsShield = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:ClearSpace(p)
		Board:SetTerrain(p, TERRAIN_MOUNTAIN)
		Board:AddShield(p)
		local isShielded = Board:IsShield(p)

		Board:ClearSpace(p)
		Board:SetTerrain(p, TERRAIN_MOUNTAIN)
		Board:AddShield(p)
		Board:RemoveShield(p)
		local isUnshielded = not Board:IsShield(p)

		Board:ClearSpace(p)
		Board:SetTerrain(p, TERRAIN_ROAD)
		local isUnshieldable = not Board:IsShield(p)

		Assert.Equals(true, isShielded)
		Assert.Equals(true, isUnshielded)
		Assert.Equals(true, isUnshieldable)

		Board:ClearSpace(p)
	else
		Assert.ShouldError(Board.IsShield, {Board, p}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_SetAcid = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local skipAnimation = true

	Board:ClearSpace(p)
	Board:SetAcid(p, true, skipAnimation)
	local isAcid = Board:IsAcid(p)

	Board:ClearSpace(p)
	Board:SetAcid(p, false, skipAnimation)
	local isNotAcid = not Board:IsAcid(p)

	Assert.Equals(true, isAcid)
	Assert.Equals(true, isNotAcid)

	Board:ClearSpace(p)

	return true
end

testsuite.test_SetFireType = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:ClearSpace(p)
		Board:SetFireType(p, FIRE_TYPE_NORMAL_FIRE)
		Assert.Equals(true, Board:IsFire(p))
		Assert.Equals(false, Board:IsForestFire(p))

		Board:SetFireType(p, FIRE_TYPE_NONE)
		Assert.Equals(false, Board:IsFire(p))

		Board:SetFireType(p, FIRE_TYPE_FOREST_FIRE)
		Assert.Equals(true, Board:IsFire(p))
		Assert.Equals(true, Board:IsForestFire(p))

		Board:SetFireType(p, FIRE_TYPE_NONE)
		Assert.Equals(false, Board:IsFire(p))

		Board:ClearSpace(p)
	else
		Assert.ShouldError(Board.SetFireType, {Board, p, FIRE_TYPE_NORMAL_FIRE}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_SetFrozen = function()
	Tests.RequireBoard()
	local p = Tests.GetNonUniqueBuildingTile()
	local skipAnimation = true
	local damage = SpaceDamage(p, 1)

	Board:ClearSpace(p)
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	Board:SetFrozen(p, true, skipAnimation)
	Board:DamageSpace(damage)
	local undamagedMountainHp = Board:GetHealth(p)

	Board:ClearSpace(p)
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	Board:SetFrozen(p, false, skipAnimation)
	Board:DamageSpace(damage)
	local damagedMountainHp = Board:GetHealth(p)

	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local maxHealth = pawn:GetHealth()
	Board:ClearSpace(p)
	Board:AddPawn(pawn, p)
	Board:SetFrozen(p, true, skipAnimation)
	Board:DamageSpace(damage)
	local undamagedPawnHp = pawn:GetHealth()

	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local maxHealth = pawn:GetHealth()
	Board:ClearSpace(p)
	Board:AddPawn(pawn, p)
	Board:SetFrozen(p, false, skipAnimation)
	Board:DamageSpace(damage)
	local damagedPawnHp = pawn:GetHealth()

	Assert.Equals(2, undamagedMountainHp)
	Assert.Equals(1, damagedMountainHp)
	Assert.Equals(maxHealth, undamagedPawnHp)
	Assert.Equals(maxHealth - 1, damagedPawnHp)

	Board:ClearSpace(p)

	return true
end

testsuite.test_SetShield = function()
	Tests.RequireBoard()
	local p = Tests.GetNonUniqueBuildingTile()
	local skipAnimation = true
	local damage = SpaceDamage(p, 1)

	Board:ClearSpace(p)
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	Board:SetShield(p, true, skipAnimation)
	Board:DamageSpace(damage)
	local undamagedMountainHp = Board:GetHealth(p)

	Board:ClearSpace(p)
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	Board:SetShield(p, false, skipAnimation)
	Board:DamageSpace(damage)
	local damagedMountainHp = Board:GetHealth(p)

	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local maxHealth = pawn:GetHealth()
	Board:ClearSpace(p)
	Board:AddPawn(pawn, p)
	Board:SetShield(p, true, skipAnimation)
	Board:DamageSpace(damage)
	local undamagedPawnHp = pawn:GetHealth()

	local pawn = PAWN_FACTORY:CreatePawn("PunchMech")
	local maxHealth = pawn:GetHealth()
	Board:ClearSpace(p)
	Board:AddPawn(pawn, p)
	Board:SetShield(p, false, skipAnimation)
	Board:DamageSpace(damage)
	local damagedPawnHp = pawn:GetHealth()

	Assert.Equals(2, undamagedMountainHp)
	Assert.Equals(1, damagedMountainHp)
	Assert.Equals(maxHealth, undamagedPawnHp)
	Assert.Equals(maxHealth - 1, damagedPawnHp)

	Board:ClearSpace(p)

	return true
end

testsuite.test_People = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		-- Set up our tile as a building
		local people = 1
		Board:SetTerrain(p, TERRAIN_BUILDING)
		Board:SetPopulated(true, p)
		Board:SetPeoplePopulated(p, people)
		Board:SetPeopleEvacuated(p, 0)

		-- Now when we evac, if we have the right values, we will
		-- see it switch from populated to evacuated.
		Board:SetPopulated(false, p)
		Assert.Equals(0, Board:GetPeoplePopulated(p))
		Assert.Equals(people, Board:GetPeopleEvacuated(p))

		-- And Repopulating does NOT switch the poeple value back but just
		-- sets the populated flag to true so we don't call that. 

		-- Clear the tile
		Board:ClearSpace(p)
		-- People is not cleared by this fn so manually do it
		Board:SetPeoplePopulated(p, 0)
		Board:SetPeopleEvacuated(p, 0)
	else
		Assert.ShouldError(Board.GetPeopleEvacuated, {Board, p}, "Function should fail without memedit")
		Assert.ShouldError(Board.GetPeoplePopulated, {Board, p}, "Function should fail without memedit")
		Assert.ShouldError(Board.SetPeoplePopulated, {Board, p, 42}, "Function should fail without memedit")
		Assert.ShouldError(Board.SetPeopleEvacuated, {Board, p, 42}, "Function should fail without memedit")
	end

	return true
end

testsuite.test_UniqueBuilding = function()
	Tests.RequireBoard()
	local p = Tests.GetCleanTile()
	local memedit = memedit:get()

	if memedit then
		Board:ClearSpace(p)
		Board:SetUniqueBuilding(p, "str_bar1")
		local uniqueBuildingName = Board:GetUniqueBuilding(p)

		Board:ClearSpace(p)
		Board:SetUniqueBuilding(p, "")
		local noUniqueBuildingName = Board:GetUniqueBuilding(p)

		Assert.Equals("str_bar1", uniqueBuildingName)
		Assert.Equals("", noUniqueBuildingName)

		Board:ClearSpace(p)
	else
		Board:ClearSpace(p)
		Board:SetUniqueBuilding(p "str_bar1")
		local isUniqueBuilding = Board:IsUniqueBuilding(p)

		Assert.Equals(true, isUniqueBuilding)

		Board:ClearSpace(p)
	end

	return true
end
