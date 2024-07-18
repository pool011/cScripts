#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This function adds a HALO Jump out option to a vehicle.
 *
 * Arguments:
 * 0: Vehicle             <OBJECT>
 * 1: Minimum altetude    <NUMBER> (Optional) (Default; 5000)
 * 4: Chute Vehicle Class <OBJECT> (Optional) (Default; "B_Parachute")
 *
 * Example:
 * ["my_c130"] call cScripts_fnc_addHaloJump
 * ["my_c130", 5000] call cScripts_fnc_addHaloJump
 * ["my_c130", 5000, "B_Parachute"] call cScripts_fnc_addHaloJump
 *
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_minAltetude", 5000, [5000]],
    ["_angle", 90, [0]],
    ["_chuteBackpackClass", "B_Parachute", ["B_Parachute"]]
];

// Check so the options arent added twice.
if (!isNil {_vehicle getVariable QEGVAR(VehicleFunc,HaloAction)}) exitWith {SHOW_WARNING_1("HaloJump", "Aircraft halo jump setting already applied for %1.", _vehicle)};

private _conditionHoldAction = format ["((_target getCargoIndex player) != -1) && ((_target animationPhase 'ramp_bottom' > 0.64) or (_target animationPhase 'door_2_1' == 1) or (_target animationPhase 'door_2_2' == 1) or (_target animationPhase 'jumpdoor_1' == 1) or (_target animationPhase 'jumpdoor_2' == 1) or (_target animationPhase 'back_ramp_switch' == 1) or (_target animationPhase 'back_ramp_half_switch' == 1) or (_target doorPhase 'RearDoors' > 0.5) or (_target doorPhase 'Door_1_source' > 0.5) or (_target animationSourcePhase 'ramp_anim' > 0.5) or (_target animationSourcePhase 'door_rf' < 0.1) or (_target animationSourcePhase 'door_lf' < 0.1)) && ((getPosVisual _target) select 2 >= %1)", _minAltetude];

// Add hold action for jump
private _actionID = [
    _vehicle,
    "<t color='#800080'>HALO Jump</t>",
    "cScripts\Data\Icon\icon_02.paa",
    "cScripts\Data\Icon\icon_02.paa",
    _conditionHoldAction,
    "true",
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_angle", "_chuteBackpackClass"];
        [_caller, _target, _chuteBackpackClass, _angle] call EFUNC(para,haloJump)
    },
    {},
    [_angle, _chuteBackpackClass],
    0,
    25,
    false
] call BIS_fnc_holdActionAdd;

_vehicle setVariable [QEGVAR(VehicleFunc,HaloAction), [_vehicle, _actionID, _minAltetude, _chuteBackpackClass]];
