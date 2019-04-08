package js.html.vr;

import js.Promise;

@:native("VRDisplay")
extern class VRDisplay {
    var depthFar : Float;
    var depthNear : Float;
    var capabilities(default,null) : VRDisplayCapabilities;
    var displayId(default,null) : Int;
    var displayName(default,null) : String;
    var isConnected(default,null) : Bool;
    var isPresenting(default,null) : Bool;
    var stageParameters(default,null) : VRStageParameters;
    function getEyeParameters() : VREyeParameters;
    function getFrameData() : VRFrameData;
    function getLayers() : Array<VRLayerInit>;
    function resetPose() : Void;
    function cancelAnimationFrame( vrSceneFrame : Int ) : Void;
    function requestAnimationFrame( callback : Float->Void ) : Int;
    //function requestPresent( o : Dynamic ) : Promise<Dynamic>; //TODO
    function requestPresent( o : Dynamic ) : Promise<Void>; //TODO
    function exitPresent() : Void;
    function submitFrame() : Void;
}
