
local extension = {
	id = "memedit",
	name = "memedit",
	version = "1.1.5",
	modApiVersion = "2.9.3",
	gameVersion = "1.2.88",
	icon = "img/icon.png",
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
	require(path.."functions/game")
	require(path.."functions/spaceDamage")
	require(path.."tests/tests")
	require(path.."ui/meminspect")

	memedit:init()
end

function extension:load(options, version)
end

return extension
