#include "..\script_component.hpp";
/*
 * Author: J.Turn
 * This function sets 
 *
 * Arguments:
 * 0: Vehicle/Object/Crate <OBJECT>
 * 1: Ace Action Category <STRING>     (Optional) (Default; ACE_MainActions)
 *
 * Return Value:
 * Main category used for creation <STRING>
 *
 * Example:
 * [this, "ACE_MainActions"] call cScripts_fnc_setupLoadoutCategories;
 * [this, "ACE_SelfActions"] call cScripts_fnc_setupLoadoutCategories;
 *
 * Public: No
 */

params [
    ["_object", objNull, [objNull]],
    ["_category", ["ACE_SelfActions"], [["ACE_SelfActions"]]]
];

private _iconCrate = "iconCrateWpns" call FUNC(getIcon);

INFO("CrateSpawner", "Generating crate spawner...");
// Create base spawner category
private _cratespawnerCategory = _category + ["cScripts_crateSpawner"];

// Create action for spawner category
private _crateSpawnerAction = [_object, "cScripts_crateSpawner", "Crate Spawner", _iconCrate, _category] call FUNC(createActionCategory);

private _containerKeys = keys GVAR(DATABASE);
// Get all crates from logistics database
{
    // Search for "crate_" in the first part of the container name and add it to the list of crates
    private _firstUnderscore = _x find "_";
    private _containerPrefix = [_x, 0, _firstUnderscore] call BIS_fnc_trimString;
    if (_containerPrefix == "crate_") then {
        [_object, _x, _x, _iconCrate, _crateSpawnerCategory] call FUNC(addCrateSpawner);
    };
} forEach _containerKeys;

INFO("CrateSpawner", "Crate spawner generated.");