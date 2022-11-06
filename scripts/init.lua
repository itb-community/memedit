
local extension = {
	id = "memedit",
	name = "memedit",
	version = "0.1.1",
	modApiVersion = "2.8.0",
	gameVersion = "1.2.83",
	isExtension = true,
	enabled = false,
}

function extension:metadata()
end

function extension:init(options)
	local path = self.resourcePath

	require(path.."memedit")
	require(path.."localization")
	require(path.."constants")
	require(path.."dummy")
	require(path.."functions/pawn")
	require(path.."functions/board")
	require(path.."tests/tests")
	require(path.."ui/meminspect")

	memedit:init()
end

function extension:load(options, version)
end

return extension
