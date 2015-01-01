package com.kris {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import kris.FunctionNameError;
	import kris.test.SuiteProvidingTestCase;
	import kris.Util;
	
	public class UtilTest extends SuiteProvidingTestCase {
		private var parent:Sprite;
		private var child:Sprite;
		
		public function UtilTest(testMethod:String = null) {
			super([
				orphanDisplayObject_works,
				setMovieClipWidth_works,
				setMovieClipHeight_works,
				listContainsItem_array_list,
				listContainsItem_object_list,
				listContainsItem_dictionary_list,
				listContainsItem_vector_list,
				listContainsItem_sad_case,
				getClassOf_works,
				getFunctionName_allows_public_functions,
				getFunctionName_generates_error_for_non_public_functions,
				getFunctionName_error_if_function_from_different_instance
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
		
		public function listContainsItem_array_list():void {
			var list:Array = [1, 2, 3];var result:Boolean = Util.listContainsItem(list, 2);
			assertTrue(result)
		}
		
		public function listContainsItem_object_list():void {
			var list:Object = {"a": 1, "b": 2, "c": 3};
			var result:Boolean = Util.listContainsItem(list, 2);
			assertTrue(result)
		}
		
		public function listContainsItem_dictionary_list():void {
			var list:Dictionary = new Dictionary();
			list["a"] = 1;
			list["b"] = 2;
			list["c"] = 3;
			var result:Boolean = Util.listContainsItem(list, 2);
			assertTrue(result)
		}
		
		public function listContainsItem_vector_list():void {
			var list:Vector.<uint> = Vector.<uint>([1, 2, 3]);var result:Boolean = Util.listContainsItem(list, 2);
			assertTrue(result)
		}
		
		public function listContainsItem_sad_case():void {
			var list:Array = [1, 2, 3];var result:Boolean = Util.listContainsItem(list, 4);
			assertFalse(result)
		}
		
		public function getClassOf_works():void {
			assertEquals(Util.getClassOf(""), String)
			assertEquals(Util.getClassOf(false), Boolean)
			assertEquals(Util.getClassOf(1), int)
			assertEquals(Util.getClassOf(1.5), Number)
			assertEquals(Util.getClassOf(new Error()), Error)
		}
		
		public function getFunctionName_allows_public_functions():void {
			var foo:UtilTest = new UtilTest()
			assertEquals("publicFunction", Util.getFunctionName(foo.publicFunction, foo))
		}
		
		public function getFunctionName_generates_error_for_non_public_functions():void {
			var foo:UtilTest = new UtilTest()
			assertThrowsUnderConditions(foo.privateFunction, foo)
			assertThrowsUnderConditions(foo.protectedFunction, foo)
		}
		
		public function getFunctionName_error_if_function_from_different_instance():void {
			assertThrowsUnderConditions(new UtilTest().publicFunction, new UtilTest())
		}
		
		private function assertThrowsUnderConditions(method:Function, object:Object):void {
			assertThrows(FunctionNameError, function():void {
					Util.getFunctionName(method, object)
				});
		}
		
		public function publicFunction():void {
		
		}
		
		protected function protectedFunction():void {
		
		}
		
		private function privateFunction():void {
		
		}
	}
}