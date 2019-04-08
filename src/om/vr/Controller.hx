package om.vr;

import js.Browser.navigator;
import js.html.Gamepad;
import js.html.vr.VRPose;
import three.core.Object3D;
import three.math.Vector3;

class Controller extends Object3D {

    var gamepad : Gamepad;

    public function new() {
        super();
        matrixAutoUpdate = false;
    }

    public function update() {
    }

    function findGamepad( id : String ) : Gamepad {
        var gamepads = navigator.getGamepads();
        for( i in 0...gamepads.length ) {
            var gamepad = gamepads[i];
            if( gamepad != null && gamepad.id == id ) {
                return gamepad;
            }
        }
        return null;
    }

}
