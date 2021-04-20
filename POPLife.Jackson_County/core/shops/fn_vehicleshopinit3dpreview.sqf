/**
 * Biblioth�que de fonctions permettant la visualisation 3D d'objets
 * 
 * Copyright (C) 2014 Team ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
    File: fn_vehicleShopInit3DPreview.sqf
    Modified By: NiiRoZz
    Description:
    Called when a player open the vehicle shop and setup cam and the while for rotate around the vehicle
*/

//life_preview_3D_vehicle_cam = "camera" camCreate [4925.28,3006.17,0.00143814];
life_preview_3D_vehicle_cam = "camera" camCreate [9386.46,9152.02,0.00143814];
life_preview_3D_vehicle_cam cameraEffect ["Internal", "BACK"];
life_preview_3D_vehicle_cam camSetFocus [-1, -1];
showCinemaBorder false;
life_preview_3D_vehicle_cam camCommit 0;

life_preview_3D_vehicle_object = objNull;


0 spawn
{

    for "_i" from 0 to 1 step 0 do {
        if (isNull life_preview_3D_vehicle_cam) exitWith {};
        private ["_objeto","_distanciaCamara","_camaraFinal"];


        waitUntil {!isNull life_preview_3D_vehicle_object};

        _objeto = life_preview_3D_vehicle_object;

        _distanciaCamara = 2.25 * (
                [boundingBoxReal _objeto select 0 select 0, boundingBoxReal _objeto select 0 select 2]
            distance
                [boundingBoxReal _objeto select 1 select 0, boundingBoxReal _objeto select 1 select 2]
        );
        _camaraFinal = 0;

        life_preview_3D_vehicle_cam camSetTarget _objeto;
        life_preview_3D_vehicle_cam camSetPos (_objeto modelToWorld [_distanciaCamara * sin _camaraFinal, _distanciaCamara * cos _camaraFinal, _distanciaCamara * 0.33]);
        life_preview_3D_vehicle_cam camCommit 0;

        for "_i" from 0 to 1 step 0 do {
            if (!(life_preview_3D_vehicle_object isEqualTo _objeto)) exitWith {};
            _camaraFinal = _camaraFinal + 1.00;

            life_preview_3D_vehicle_cam camSetPos (_objeto modelToWorld [_distanciaCamara * sin _camaraFinal, _distanciaCamara * cos _camaraFinal, _distanciaCamara * 0.33]);
            life_preview_3D_vehicle_cam camCommit 0.05;

            sleep 0.05;
        };
    };
};