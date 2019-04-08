package js.html.vr;

#if (haxe_ver>=4)
import js.lib.Float32Array;
#else
import js.html.Float32Array;
#end

typedef VRPose = {
    var position(default,null) : Float32Array;
    var linearVelocity(default,null) : Float32Array;
    var linearAcceleration(default,null) : Float32Array;
    var orientation(default,null) : Float32Array;
    var angularAcceleration(default,null) : Float32Array;
    var angularVelocity(default,null) : Float32Array;
}
