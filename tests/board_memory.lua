local testsuite = Tests.Testsuite()
testsuite.name = "Memedit-generated-board-functions tests"
Testsuites["board-memedit"] = testsuite


testsuite.test_tile_acid = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()

	Board:SetAcid(p, true)
	local isAcid = memedit.dll.board.isAcid(p)
	Assert.Equals(true, isAcid)

	Board:SetAcid(p, false)
	local isNotAcid = not memedit.dll.board.isAcid(p)
	Assert.Equals(true, isNotAcid)

	return true
end

testsuite.test_tile_frozen = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)

	Board:SetFrozen(p, true)
	local isFrozen = memedit.dll.board.isFrozen(p)
	Assert.Equals(true, isFrozen)

	Board:SetFrozen(p, false)
	local isNotFrozen = not memedit.dll.board.isFrozen(p)
	Assert.Equals(true, isNotFrozen)

	return true
end

testsuite.test_tile_health = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetNonUniqueBuildingTile()

	Board:SetTerrain(p, TERRAIN_BUILDING)
	Board:SetHealth(p, 3,4)
	local health = memedit.dll.board.getHealth(p)
	local maxHealth = memedit.dll.board.getMaxHealth(p)
	Assert.Equals(3, health)
	Assert.Equals(4, maxHealth)

	Board:ClearSpace(p)
	return true
end

testsuite.test_tile_rubbleType = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetNonUniqueBuildingTile()

	Board:SetTerrain(p, TERRAIN_BUILDING)
	Board:SetTerrain(p, TERRAIN_RUBBLE)
	local rubbleTypeBuilding = memedit.dll.board.getRubbleType(p)
	Assert.Equals(0, rubbleTypeBuilding)

	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	Board:SetTerrain(p, TERRAIN_RUBBLE)
	local rubbleTypeMountain = memedit.dll.board.getRubbleType(p)
	Assert.Equals(1, rubbleTypeMountain)

	Board:ClearSpace(p)
	return true
end

testsuite.test_tile_shield = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()
	Board:SetTerrain(p, TERRAIN_MOUNTAIN)

	Board:SetShield(p, true)
	local isShield = memedit.dll.board.isShield(p)
	Assert.Equals(true, isShield)

	Board:SetShield(p, false)
	local isNotShield = not memedit.dll.board.isShield(p)
	Assert.Equals(true, isNotShield)

	return true
end

testsuite.test_tile_smoke = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()

	Board:SetSmoke(p, true, true)
	local isSmoke = memedit.dll.board.isSmoke(p)
	Assert.Equals(true, isSmoke)

	Board:SetSmoke(p, false, true)
	local isNotSmoke = not memedit.dll.board.isSmoke(p)
	Assert.Equals(true, isNotSmoke)

	return true
end

testsuite.test_tile_terrain = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()

	Board:SetTerrain(p, TERRAIN_MOUNTAIN)
	local terrain = memedit.dll.board.getTerrain(p)
	Assert.Equals(TERRAIN_MOUNTAIN, terrain)

	Board:ClearSpace(p)
	return true
end

testsuite.test_tile_terrainIcon = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()

	Board:SetTerrainIcon(p, "testTerrainIcon")
	local terrainIcon = memedit.dll.board.getTerrainIcon(p)
	Assert.Equals("testTerrainIcon", terrainIcon)

	Board:SetTerrainIcon(p, "")
	local terrainIcon = memedit.dll.board.getTerrainIcon(p)
	Assert.Equals("", terrainIcon)

	return true
end

testsuite.test_tile_uniqueBuildingName = function()
	Tests.RequireBoard()
	Tests.RequireMemedit()
	local p = Tests.GetCleanTile()

	-- If this test is run many times, it will clutter
	-- up the board with many unique buildings.
	--
	-- We could use the following function to clear them:
	-- memedit.dll.board.getUniqueBuildingName
	--
	-- However, it is preferred to only read and not
	-- write to memory when testing.
	Board:SetTerrain(p, TERRAIN_BUILDING)
	Board:AddUniqueBuilding("str_bar1")

	for i, p in ipairs(Board) do
		local uniqueBuildingName = memedit.dll.board.getUniqueBuildingName(p)
		if Board:IsUniqueBuilding(p) then
			Assert.NotEquals("", uniqueBuildingName)
		else
			Assert.Equals("", uniqueBuildingName)
		end
	end

	return true
end
