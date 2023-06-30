#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A, SPC.Turn.J
 * This function return a array of content
 *
 * Arguments:
 * None
 *
 * Return:
 * ARRAY of items or empty
 *
 * Example:
 * call cScripts_fnc_logiDB_medicalVehicle;
 * 
 * Public: No
 */

// List items in inventory by category. 

private _dataArray = [
    ["vehicle_medicalAtlas", [
    // Inventory Contents
    
    // AEDs
    ["kat_AED",1],

    // Bandages
    ["ACE_elasticBandage",150],
    ["ACE_packingBandage",90],
    ["ACE_quikclot",150],

    // Tourniquets
    ["ACE_tourniquet",20],

    // Fluids
    ["ACE_plasmaIV",30],
    ["ACE_plasmaIV_500",30],
    ["ACE_salineIV_250",20],

    // IV & IO Catheters
    ["kat_IO_FAST",20],
    ["kat_IV_16",40],

    // Blood Pressure Medication
    ["kat_nitroglycerin",40],
    ["kat_phenylephrine",40],
    ["kat_norepinephrine",40],

    // Hemorrhage Control Medication
    ["kat_EACA",40],
    ["kat_TXA",40],

    // Oral Medication
    ["kat_carbonate",20],
    ["kat_Painkiller",40],

    // Autoinjector & Nasal Spray Medication
    ["kat_naloxone",20],
    ["ACE_morphine",20],
    ["ACE_epinephrine",40],
    ["ACE_phenylephrine_inject",40],

    // Splints
    ["ACE_splint",20],

    // Surgical Equipment
    ["kat_scalpel",40],
    ["kat_plate",10],
    ["kat_clamp",1],
    ["kat_retractor",1],
    ["kat_vacuum",1],

    // Surgical Medication
    ["kat_lidocaine",20],
    ["kat_lorazepam",10],
    ["kat_etomidate",20],
    ["kat_flumazenil",10],

    // Surgical Kits
    ["ACE_surgicalKit",4],

    // Body Bags
    ["ACE_bodyBag",10],

    // E-Tools
    ["ACE_EntrenchingTool",4],

    // Signalling equipment //
    
    // Smokes
    ["SmokeShell",16],
    ["SmokeShellBlue",4],
    ["SmokeShellGreen",4],
    ["SmokeShellPurple",4],
        
    // Flags and Paint
    ["ace_marker_flags_green",4],
    ["ace_marker_flags_red",4],
    ["ace_marker_flags_blue",4],
    ["ACE_SpraypaintBlue",1],
    ["ACE_SpraypaintRed",1],

    // Rifle ammo
    ["rhs_mag_30Rnd_556x45_M855A1_PMAG",24], // M855A1 PMAGs
    ["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red",8] // M856A1 PMAGs

    ]];
];

_dataArray;