package com.kris {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
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
				listContainsItem_array,
				listContainsItem_object,
				listContainsItem_dictionary,
				listContainsItem_vector,
				listContainsItem_sad_case
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
		
		public function listContainsItem_array():void {
			var item:Object = new Object()
			var list:Array = [null, item, null]
			
			var result:Boolean = Util.listContainsItem(list, item);
			
			assertTrue(result)
		}
		
		public function listContainsItem_object():void {
			var item:Object = new Object()
			var list:Object = {"A":null, "Uncle bob": item, "Z":null}
			
			var result:Boolean = Util.listContainsItem(list, item);
			
			assertTrue(result)
		}
		
		public function listContainsItem_dictionary():void {
			var item:Object = new Object()
			var list:Dictionary = new Dictionary()
			list["A"] = null;
			list[4] = item;
			list[new Object()] = null;
			
			var result:Boolean = Util.listContainsItem(list, item);
			
			assertTrue(result)
		}
		
		public function listContainsItem_vector():void {
			var item:Array = [];
			var list:Vector.<Array> = new Vector.<Array>()
			list.push([]);
			list.push(item);
			list.push([]);
			var result:Boolean = Util.listContainsItem(list, item);
			assertTrue(result)
		}
		
		public function listContainsItem_sad_case():void {
			var list:Array = [null, null, null]
			var result:Boolean = Util.listContainsItem(list, new Object());
			assertFalse(result)
		}
	}
}