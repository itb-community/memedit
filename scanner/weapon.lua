
local path = GetParentPath(...)
local Scan = require(path.."scan")
local utils = require(path.."utils")

local inheritClass = utils.inheritClass
local prepareScanPawn = utils.prepareScanPawn
local prepareScanWeapon = utils.prepareScanWeapon
local weaponPrerequisites = {
	"vital.size_pawn",
	"vital.size_weapon",
	"vital.delta_weapons"
}
local scans = {}


scans.baseType = inheritClass(Scan, {
	id = "BaseType",
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
	id = "Class",
	name = "Weapon Class",
	prerequisiteScans = weaponPrerequisites,
	access = "RW",
	dataType = "string",
	action = function(self)
		local classes = {"Prime","Brute","Ranged","Science"}
		local class = random_removal(classes)
		prepareScanWeapon{}
		prepareScanPawn{ Class = class, SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
		local weaponIndex = 1

		self:searchWeapon(pawn, weaponIndex, class)
		self:evaluateResults()
	end
})

scans.powerCost = inheritClass(Scan, {
	id = "PowerCost",
	name = "Weapon Power Cost",
	prerequisiteScans = weaponPrerequisites,
	access = "RW",
	dataType = "int",
	action = function(self)
		local cores = math.random(7,13)
		prepareScanWeapon{ PowerCost = cores }
		prepareScanPawn{ SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")
		local weaponIndex = 1

		self:searchWeapon(pawn, weaponIndex, cores)
		self:evaluateResults()
	end
})

scans.powerList = inheritClass(Scan, {
	id = "PowerList",
	name = "Weapon Power List",
	prerequisiteScans = weaponPrerequisites,
	access = "R",
	dataType = "IntList",
	actions = {
		function(self)
			local weaponIndex = 1
			local cores = math.random(7,13)
			local powerList = {}
			for i = 1, cores do
				powerList[i] = 1
			end

			prepareScanWeapon{
				PowerCost = cores,
				Upgrades = 0,
				UpgradeCost = {0,0}
			}
			prepareScanPawn{ SkillList = {"memedit_scanWeapon"} }
			local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")

			self:searchWeapon(pawn, weaponIndex, powerList, "int")
			self:evaluateResults()
		end
	}
})

scans.type = inheritClass(scans.baseType, {
	id = "Type",
	name = "Weapon Type",
	expectedResultIndex = 2,
})

scans.upgradeListA = inheritClass(Scan, {
	id = "UpgradeListA",
	name = "Weapon Upgrade List A",
	prerequisiteScans = weaponPrerequisites,
	access = "R",
	dataType = "IntList",
	action = function(self)
		local weaponIndex = 1
		local cores = math.random(7,13)
		local powerList = {}
		for i = 1, cores do
			powerList[i] = 0
		end
		prepareScanWeapon{
			PowerCost = 0,
			Upgrades = 2,
			UpgradeCost = {cores,0}
		}
		prepareScanPawn{ SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")

		self:searchWeapon(pawn, weaponIndex, powerList, "int")
		self:evaluateResults()
	end
})

scans.upgradeListB = inheritClass(Scan, {
	id = "UpgradeListB",
	name = "Weapon Upgrade List B",
	prerequisiteScans = weaponPrerequisites,
	access = "R",
	dataType = "IntList",
	action = function(self)
		local weaponIndex = 1
		local cores = math.random(7,13)
		local powerList = {}
		for i = 1, cores do
			powerList[i] = 0
		end
		prepareScanWeapon{
			PowerCost = 0,
			Upgrades = 2,
			UpgradeCost = {0,cores}
		}
		prepareScanPawn{ SkillList = {"memedit_scanWeapon"} }
		local pawn = PAWN_FACTORY:CreatePawn("memedit_scanPawn")

		self:searchWeapon(pawn, weaponIndex, powerList, "int")
		self:evaluateResults()
	end
})

return scans
