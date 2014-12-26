package com.kris {
	import flash.display.Sprite;
	import kris.test.SuiteProvidingTestCase;
	import kris.Util;
	
	public class UtilTest extends SuiteProvidingTestCase {
		private var parent:Sprite;
		private var child:Sprite;
		
		public function UtilTest(testMethod:String = null) {
			super([orphanDisplayObject_works], testMethod);
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
	
	}
}