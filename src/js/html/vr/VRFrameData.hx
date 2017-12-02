package js.html.vr;

typedef VRFrameData = {

    var timestamp(default,never) : Float; //DOMHighResTimeStamp

    var leftProjectionMatrix(default,never) : Float32Array;
    var leftViewMatrix(default,never) : Float32Array;

    var rightProjectionMatrix(default,never) : Float32Array;
    var rightViewMatrix(default,never) : Float32Array;

    var pose(default,never) : VRPose;
};
