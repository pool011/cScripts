#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This function sets a player radio channels based on squad name. If -1 no radio will be set. 
 *
 * Arguments:
 * 0: Argument Name <OBJECT/BOOL/NUMBER/STRING/ARRAY/CODE> (Optional) (Default; MyDefaultValue)
 *
 * Return Value:
 * Return Name <BOOL/NUMBER/STRING>
 *
 * Example:
 * ["bob"] call cScripts_fnc_setRadioChannel
 *
 * Public: No
 */
#define DEBUG_MODE;

params [["_player", objNull, [objNull]]];

[{[] call acre_api_fnc_isInitialized}, {
    private _playerRadios = [(_this select 0)] call acre_api_fnc_getCurrentRadioList;
    {
        if !(_x == "") then {
            private _channel = [(_this select 0)] call FUNC(getRadioChannel);

            [_x, _channel] call acre_api_fnc_setRadioChannel;

            #ifdef DEBUG_MODE
                [format["%1 radio (%2) have have its channel set to %3",(_this select 0), _x, _channel]] call FUNC(logInfo);
            #endif
        } else {
            [format["Empty radio is trying to get it's channel applied for %1.",(_this select 0)]] call FUNC(logWarning);
        };
    } forEach _playerRadios;
}, [_player]] call CBA_fnc_waitUntilAndExecute;
