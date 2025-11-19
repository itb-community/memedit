
function Tests.RequireMemedit()
	assert(memedit:get() ~= nil, "Error: this test requires memedit.dll to be available and calibrated" .. "\n" .. debug.traceback("", 2))
end

function Tests.GetCleanTile()
	local tiles = randomize(extract_table(Board:GetTiles()))

	for i, p in ipairs(tiles) do
		if not Board:IsPawnSpace(p) then
			Board:ClearSpace(p)
			return p
		end
	end

	error("Error: no non-pawn tile available")
end

function Tests.GetNonUniqueBuildingTile()
	local tiles = randomize(extract_table(Board:GetTiles()))

	for i, p in ipairs(tiles) do
		if not Board:IsPawnSpace(p) then
			if not Board:IsUniqueBuilding(p) then
				Board:ClearSpace(p)
				return p
			end
		end
	end

	error("Error: no non-pawn, non-unique-building tile available")
end

function Tests.GetUncleanedBuilding()
	local tiles = randomize(extract_table(Board:GetTiles()))

	for i, p in ipairs(tiles) do
		if Board:IsBuilding(p) then
			return p
		end
	end

	error("Error: no building tile available")
end

function Tests.GetUncleanedNonBuilding()
	local tiles = randomize(extract_table(Board:GetTiles()))

	for i, p in ipairs(tiles) do
		if not Board:IsBuilding(p) then
			return p
		end
	end

	error("Error: no non-building tile available")
end
