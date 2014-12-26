package com.test {
	import asunit.textui.TestRunner;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * Tests the personal library code i have written in the global class path.
	 * @author Kristian Welsh
	 */
	public class Tests extends Sprite {
		public function Tests():void {
			var testRunner:TestRunner = new TestRunner();
			addChild(testRunner);
			testRunner.start(TestCases);
		}
	}
}