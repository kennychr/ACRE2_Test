/*
 * Author: Pfc.Christiansen
 * []
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * Nothing, may add a BOOL
 *
 * Example:
 * Runs from unit editor field.
 * [this,CMD] execVM "path\radio_aw_build.sqf";
 *
 * Public: [Yes/No]
 */
 private["_unit", "_localUnitType", "_localRadioList"];
 _unit = _this select 0;
 _localUnitType = _this selet 1;
if(player != _unit) exitWith { false };

// Copy preset
["ACRE_PRC148", "default", "AWnato"] call acre_api_fnc_copyPreset;
["ACRE_PRC152", "default", "AWnato"] call acre_api_fnc_copyPreset;
["ACRE_PRC117F", "default", "AWnato"] call acre_api_fnc_copyPreset;

// Rename channels
["ACRE_PRC152", "AWnato", 1, "description", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "AWnato", 2, "description", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "AWnato", 3, "description", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "AWnato", 4, "description", "COY"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "AWnato", 5, "description", "CAS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "AWnato", 6, "description", "FIRES"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC148", "AWnato", 1, "label", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "AWnato", 2, "label", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "AWnato", 3, "label", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "AWnato", 4, "label", "COY"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "AWnato", 5, "label", "CAS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "AWnato", 6, "label", "FIRES"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC117F", "AWnato", 1, "name", "PLTNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "AWnato", 2, "name", "PLTNET 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "AWnato", 3, "name", "PLTNET 3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "AWnato", 4, "name", "COY"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "AWnato", 5, "name", "CAS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "AWnato", 6, "name", "FIRES"] call acre_api_fnc_setPresetChannelField;

//Store the presets
["ACRE_PRC152", "AWnato"] call acre_api_fnc_setPreset;
["ACRE_PRC148", "AWnato"] call acre_api_fnc_setPreset;
["ACRE_PRC117F", "AWnato"] call acre_api_fnc_setPreset;


//Add radio to player based on class,and maybe switch to correct channel

_this spawn {
  _unit = _this select 0;
  _localUnitType = _this select 1;
  waitUntil { ([] call acre_api_fnc_isInitialized) };
  switch _localUnitType do {
    case 'CMD' : {_unit linkItem "ACRE_PRC152";_unit linkItem "ACRE_PRC117F"};
    case 'A_L' : {_unit linkItem "ACRE_PRC152"};
    case 'B_L' : {_unit linkItem "ACRE_PRC152"};
    case 'C_L' : {_unit linkItem "ACRE_PRC152"};

  };

};
