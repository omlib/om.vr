
import js.Browser.console;
import js.Browser.document;
import js.Browser.window;
import om.VR;

class App {

	static function main() {

		window.onload = function(){

			var info = document.getElementById( 'info' );

			VR.getDisplays().then( function(displays:Array<Dynamic>){

				if( displays.length > 0 ) {

					for( display in displays ) {

						console.debug( display );

						var e = document.createDivElement();
						e.innerHTML += '<h2>VRDisplay</h2>';
						e.innerHTML += '<div>displayName: <b>'+display.displayName+'</b></div>';
						e.innerHTML += '<div>displayId: <b>'+display.displayId+'</b></div>';
						e.innerHTML += '<div>isPresenting: <b>'+display.isPresenting+'</b></div>';
						e.innerHTML += '<div>depthFar: <b>'+display.depthFar+'</b></div>';
						e.innerHTML += '<div>depthNear: <b>'+display.depthNear+'</b></div>';
						e.innerHTML += '<div>stageParameters: <b>'+display.stageParameters+'</b></div>';
						e.innerHTML += '<div>capabilities: <b>';
						e.innerHTML += '<div>&emsp;canPresent: <b>'+display.capabilities.canPresent+'</b></div>';
						e.innerHTML += '<div>&emsp;hasExternalDisplay: <b>'+display.capabilities.hasExternalDisplay+'</b></div>';
						e.innerHTML += '<div>&emsp;hasOrientation: <b>'+display.capabilities.hasOrientation+'</b></div>';
						e.innerHTML += '<div>&emsp;hasPosition: <b>'+display.capabilities.hasPosition+'</b></div>';
						e.innerHTML += '<div>&emsp;maxLayers: <b>'+display.capabilities.maxLayers+'</b></div>';
						e.innerHTML += '</div>';
						info.appendChild( e );
					}
				} else {
					info.textContent = '0 vr displays found';
				}

			}).catchError( function(e){
				console.error(e);
				info.classList.add( 'error' );
				info.textContent = 'failed to get vr displays: '+e;
			} );
		}
	}

}
