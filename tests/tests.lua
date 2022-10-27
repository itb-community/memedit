
local path = GetParentPath(...)

modApi.events.onTestsuitesCreated:subscribe(function()
	require(path.."utils")
	require(path.."board_memory")
	require(path.."pawn_memory")
	require(path.."board")
	require(path.."pawn")
end)
