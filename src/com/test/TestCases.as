package com.test {
	import asunit.framework.TestSuite;
	import com.assertTest;
	import com.kris.AssertionFailedErrorTest;
	import kris.test.TestSuiteCollector;
	
	public class TestCases extends TestSuiteCollector {
		public function TestCases() {
			super();
			includeTestsFrom(assertTest)
			includeTestsFrom(AssertionFailedErrorTest)
		}
	}
}