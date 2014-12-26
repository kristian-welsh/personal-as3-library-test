package com.kris {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import kris.test.SuiteProvidingTestCase;
	import kris.Util;
	
	public class UtilTest extends SuiteProvidingTestCase {
		private var parent:Sprite;
		private var child:Sprite;
		
		public function UtilTest(testMethod:String = null) {
			super([
			orphanDisplayObject_works,
			setMovieClipWidth_works,
			setMovieClipHeight_works
			], testMethod);
		}
		
		public function orphanDisplayObject_works():void {
			setupChildWithParent();
			Util.orphanDisplayObject(child)
			assertEquals(0, parent.numChildren)
		}
		
		private function setupChildWithParent():void {
			parent = new Sprite();
			child = new Sprite();
			parent.addChild(child)
			assert(1 == parent.numChildren)
		}
		
		public function setMovieClipWidth_works():void {
			var movieClip:MovieClip = new MovieClip()
			Util.setMovieClipWidth(movieClip, 500)
			assertEquals(2, movieClip.numChildren)
			assertEquals(500, movieClip.width)
		}
		
		public function setMovieClipHeight_works():void {
			var movieClip:MovieClip = new MovieClip()
			Util.setMovieClipHeight(movieClip, 500)
			assertEquals(2, movieClip.numChildren)
			assertEquals(500, movieClip.height)
		}
	}
}