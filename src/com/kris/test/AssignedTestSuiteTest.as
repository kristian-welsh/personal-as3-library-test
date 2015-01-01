package com.kris.test {
	import asunit.framework.TestCase;
	import kris.test.AssignedTestSuite;
	import kris.test.SuiteProvidingTestCase;
	import org.flashdevelop.utils.FlashConnect;
	
	public class AssignedTestSuiteTest extends SuiteProvidingTestCase {
		public function AssignedTestSuiteTest(testMethod:String = null) {
			super([you_can_add_test_name_strings], testMethod);
		}
		
		public function you_can_add_test_name_strings():void {
			var assignedSuite:AssignedTestSuite = new AssignedTestSuite(TestCase)
			assignedSuite.addTest("")
			assertEquals(1, assignedSuite.getSuite().testCount())
		}
	}
}