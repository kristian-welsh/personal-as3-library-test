package com {
	import kris.AssertionFailedError;
	import kris.test.SuiteProvidingTestCase;
	
	public class assertTest extends SuiteProvidingTestCase {
		public function assertTest(testMethod:String = null) {
			super([
			true_conditions_do_nothing,
			false_conditions_throw_AssertionFailedError
			], testMethod);
		}
		
		public function true_conditions_do_nothing():void {
			try {
				passAssertion();
			} catch (error:AssertionFailedError) {
				fail("An AssertionFailedError was thrown, but should not have been");
			}
		}
		
		public function false_conditions_throw_AssertionFailedError():void {
			try {
				failAssertion();
				fail("An AssertionFailedError thould have been thrown, but was not");
			} catch (error:AssertionFailedError) {
				assertEquals("foo bar baz", error.message);
			}
		}
		
		private function passAssertion():void {
			assert(true, "foo bar baz")
		}
		
		private function failAssertion():void {
			assert(false, "foo bar baz")
		}
	}
}