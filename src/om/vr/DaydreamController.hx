package om.vr;

import js.Browser.navigator;
import js.html.Gamepad;
import js.html.VRPose;
import three.core.Object3D;
import three.math.Vector3;

class DaydreamController extends Object3D {

    public dynamic function onAxes( axes : Array<Float> ) {}
    public dynamic function onTouchpad( down : Bool ) {}
    public dynamic function onVelocity( v : Vector3 ) {}

    public var touchpadPressed(default,null) : Bool;
    public var axes(default,null) : Array<Float>;
    public var angularVelocity(default,null) : Vector3;

    var gamepad : Gamepad;

    public function new() {
        super();
        matrixAutoUpdate = false;
        touchpadPressed = false;
        axes = [0,0];
        angularVelocity = new Vector3();
    }

    public function update() {
        gamepad = findGamepad();
        if( gamepad != null && untyped gamepad.pose != null ) {
            var pose : VRPose = untyped gamepad.pose;
            if( pose == null )
                return; // no user action yet
            if( pose.orientation != null )
                quaternion.fromArray( cast pose.orientation );
            updateMatrix();
    		visible = true;
            if( pose.angularVelocity != null && !angularVelocity.equals( cast pose.angularVelocity ) ){
                angularVelocity.fromArray( cast pose.angularVelocity );
                onVelocity( angularVelocity );
            }
            if( axes[0] != gamepad.axes[0] || axes[1] != gamepad.axes[1] ) {
				axes[0] = gamepad.axes[0];
				axes[1] = gamepad.axes[1];
                onAxes( axes );
			}
            if( touchpadPressed != gamepad.buttons[0].pressed ) {
				touchpadPressed = gamepad.buttons[0].pressed;
                onTouchpad( touchpadPressed );
			}
        }
    }

    static function findGamepad( id = 'Daydream Controller' ) : js.html.Gamepad {
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
