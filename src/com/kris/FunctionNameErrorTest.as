package com.kris {
	import kris.FunctionNameError;
	import kris.test.SuiteProvidingTestCase;
	
	public class FunctionNameErrorTest extends SuiteProvidingTestCase {
		public function FunctionNameErrorTest(testMethod:String = null) {
			super([stores_correct_name_and_message], testMethod);
		}
		
		public function stores_correct_name_and_message():void {
			var error:FunctionNameError = new FunctionNameError("foo")
			assertEquals("foo", error.message);
			assertEquals("FunctionNameError", error.name);
		}
	}
}