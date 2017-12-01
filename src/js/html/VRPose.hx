package js.html;

typedef VRPose = {
    var position(default,null) : Float32Array;
    var linearVelocity(default,null) : Float32Array;
    var linearAcceleration(default,null) : Float32Array;
    var orientation(default,null) : Float32Array;
    var angularAcceleration(default,null) : Float32Array;
}
