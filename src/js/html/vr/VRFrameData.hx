package js.html.vr;

#if (haxe_ver>=4)
import js.lib.Float32Array;
#else
import js.html.Float32Array;
#end

typedef VRFrameData = {

    var timestamp(default,never) : Float; //DOMHighResTimeStamp

    var leftProjectionMatrix(default,never) : Float32Array;
    var leftViewMatrix(default,never) : Float32Array;

    var rightProjectionMatrix(default,never) : Float32Array;
    var rightViewMatrix(default,never) : Float32Array;

    var pose(default,never) : VRPose;
};
