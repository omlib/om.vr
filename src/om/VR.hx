package om;

import js.Promise;
import js.html.VRDisplay;

class VR {

    /**
        https://developer.mozilla.org/en-US/docs/Web/API/Navigator/getVRDisplays
    */
    public static inline function getDisplays() : Promise<Array<VRDisplay>> {
        return untyped navigator.getVRDisplays();

    }
}
