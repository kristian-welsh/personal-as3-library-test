package com.kris {
	import asunit.errors.AssertionFailedError;
	import kris.test.SuiteProvidingTestCase;
	
	public class AssertionFailedErrorTest extends SuiteProvidingTestCase {
		public function AssertionFailedErrorTest(testMethod:String = null) {
			super([stores_correct_name_and_message], testMethod);
		}
		
		public function stores_correct_name_and_message():void {
			var error:AssertionFailedError = new AssertionFailedError("foo")
			assertEquals("foo", error.message);
			assertEquals("AssertionFailedError", error.name);
		}
	}
}