@testable import GildedRose

import Testing

struct DexterityVest {

	@Test
	func nameIsSame() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 5, quality: 5)]
		let app = GildedRose(items: items)
		
		#expect(app.items[0].name == "+5 Dexterity Vest")

		app.updateQuality()
		
		#expect(app.items[0].name == "+5 Dexterity Vest")

		app.updateQuality()
		
		#expect(app.items[0].name == "+5 Dexterity Vest")
	}

	@Test
	func startingAtZero_day0() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 0)]
		let app = GildedRose(items: items)
		
		#expect(app.items[0].sellIn == 0)
		#expect(app.items[0].quality == 0)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 8, quality: 16)]
		let app = GildedRose(items: items)
		
		#expect(app.items[0].sellIn == 8)
		#expect(app.items[0].quality == 16)
	}
	
	@Test
	func sellIn_quality_day1() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 8, quality: 16)]
		let app = GildedRose(items: items)
		
		app.updateQuality()
		
		#expect(app.items[0].sellIn == 7)
		#expect(app.items[0].quality == 15)
	}
	
	@Test
	func qualityDecreasesTwiceAsFastAfterSellDate() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 1, quality: 6)]
		let app = GildedRose(items: items)
		
		app.updateQuality()
		
		#expect(app.items[0].sellIn == 0)
		#expect(app.items[0].quality == 5)
		
		app.updateQuality()
		
		#expect(app.items[0].sellIn == -1)
		#expect(app.items[0].quality == 3)
		
		app.updateQuality()
		
		#expect(app.items[0].sellIn == -2)
		#expect(app.items[0].quality == 1)
	}
	
	@Test
	func qualityNeverGoUnder0() {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: 5, quality: 1)]
		let app = GildedRose(items: items)
		
		app.updateQuality()
		
		#expect(app.items[0].sellIn == 4)
		#expect(app.items[0].quality == 0)

		app.updateQuality()
		
		#expect(app.items[0].sellIn == 3)
		#expect(app.items[0].quality == 0)
	}
}
