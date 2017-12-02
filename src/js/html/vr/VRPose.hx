package js.html.vr;

typedef VRPose = {
    var position(default,null) : Float32Array;
    var linearVelocity(default,null) : Float32Array;
    var linearAcceleration(default,null) : Float32Array;
    var orientation(default,null) : Float32Array;
    var angularAcceleration(default,null) : Float32Array;
    var angularVelocity(default,null) : Float32Array;
}
