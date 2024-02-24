#include "..\script_component.hpp";

params [
    ["_object", objNull, [objNull]],
    ["_lable", "", [""]],
    ["_className", "", [""]],
    ["_icon", "", [""]],
    ["_category", ["ACE_SelfActions"], [["ACE_SelfActions"]]]
];

private _iconCrate = "iconCrateWpns" call FUNC(getIcon);

// Add ACE interaction
private _crateSelection = [format ["cScripts_CrateSpawner_%1", _className], _lable, _icon, {
    params ["_object", "_caller", "_params"];
    _params params ["_className"];
    // Looks for empty space around player
    

    SHOW_CHAT_LOG_1("CrateSpawner", "Spawned %1 crate", _classname);

}, {true}, {}, [_className]] call ace_interact_menu_fnc_createAction;

private _actionType = parseNumber (isPlayer _object);
[_object, _actionType, _category, _crateSelection] call ace_interact_menu_fnc_addActionToObject;