
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local inheritClass = utils.inheritClass
local prepareScanPawn = utils.prepareScanPawn
local prepareScanWeapon = utils.prepareScanPawn
local weaponPrerequisites = {
	"vital.size_pawn",
	"vital.size_weapon",
	"vital.delta_weapons"
}
local scans = {}


scans.baseType = inheritClass(Scan, {
	id = "WeaponBaseType",
	name = "Weapon Base Type",
	prerequisiteScans = weaponPrerequisites,
	expectedResults = 2,
	expectedResultIndex = 1,
	access = "R",
	dataType = "string",
	action = function(self)
		prepareScanWeapon{}
		prepareScanPawn{ SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
		local weaponIndex = 1

		self:searchWeapon(pawn, weaponIndex, "memedit_scanWeapon")
		self:evaluateResults()
	end
})

scans.class = inheritClass(Scan, {
	id = "WeaponClass",
	name = "Weapon Class",
	prerequisiteScans = weaponPrerequisites,
	access = "RW",
	dataType = "string",
	action = function(self)
		local classes = {"Prime","Brute","Ranged","Science"}
		local class = random_removal(classes)
		LOG("test class",class)
		prepareScanWeapon{ }
		prepareScanPawn{ Class = class, SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
		local weaponIndex = 1

		self:searchWeapon(pawn, weaponIndex, class)
		self:evaluateResults()
	end
})

scans.type = inheritClass(scans.baseType, {
	id = "WeaponType",
	name = "Weapon Type",
	expectedResultIndex = 2,
})

return scans
