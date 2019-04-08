package js.html.vr;

#if (haxe_ver>=4)
import js.lib.Float32Array;
#else
import js.html.Float32Array;
#end

typedef VRStageParameters = {
    var sittingToStandingTransform(default,null) : Float32Array;
    var sizeX(default,null) : Float;
    var sizeY(default,null) : Float;
};
