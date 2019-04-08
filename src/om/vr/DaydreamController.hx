package om.vr;

import js.Browser.navigator;
import js.html.Gamepad;
import js.html.vr.VRPose;
import three.core.Object3D;
import three.math.Vector3;

class DaydreamController extends Controller {

    public static inline var GAMEPAD_ID = 'Daydream Controller';

    //public dynamic function onAxes( axes : Array<Float> ) {}
    //public dynamic function onTouchpad( down : Bool ) {}
    //public dynamic function onVelocity( v : Vector3 ) {}

    public var touchpadPressed(default,null) : Bool;
    public var axes(default,null) : Array<Float>;
    public var angularVelocity(default,null) : Vector3;

    public function new() {

        super();

        matrixAutoUpdate = false;
        touchpadPressed = false;
        axes = [0,0];
        angularVelocity = new Vector3();
    }

    public override function update() {
        gamepad = findGamepad( GAMEPAD_ID );
        if( gamepad != null && untyped gamepad.pose != null ) {
            var pose : VRPose = untyped gamepad.pose;
            if( pose == null )
                return; // no user action yet
            if( pose.orientation != null )
                this.quaternion.fromArray( cast pose.orientation );
            updateMatrix();
    		visible = true;
            if( pose.angularVelocity != null && !angularVelocity.equals( cast pose.angularVelocity ) ){
                angularVelocity.fromArray( cast pose.angularVelocity );
                //onVelocity( angularVelocity );
            }
            if( axes[0] != gamepad.axes[0] || axes[1] != gamepad.axes[1] ) {
				axes[0] = gamepad.axes[0];
				axes[1] = gamepad.axes[1];
                //onAxes( axes );
			}
            if( touchpadPressed != gamepad.buttons[0].pressed ) {
				touchpadPressed = gamepad.buttons[0].pressed;
                //onTouchpad( touchpadPressed );
			}
        }
    }

}
