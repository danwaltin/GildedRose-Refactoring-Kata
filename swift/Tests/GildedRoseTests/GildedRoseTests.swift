@testable import GildedRose

import Testing

struct DexterityVest {
	
	private func appWithDexterityVest(sellIn: Int, quality: Int) -> GildedRose {
		let items = [Item(name: "+5 Dexterity Vest", sellIn: sellIn, quality: quality)]
		return GildedRose(items: items)
	}
	
	private func expect(sellIn: Int,
						quality: Int,
						_ app: GildedRose,
						fileID: String = #fileID,
						filePath: String = #filePath,
						line: Int = #line,
						column: Int = #column) {
		
		let sourceLocation = SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
		
		#expect(app.items[0].sellIn == sellIn, sourceLocation: sourceLocation)
		#expect(app.items[0].quality == quality, sourceLocation: sourceLocation)
	}
	
	@Test
	func nameIsSame() {
		let app = appWithDexterityVest(sellIn: 5, quality: 5)
		
		#expect(app.items[0].name == "+5 Dexterity Vest")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "+5 Dexterity Vest")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "+5 Dexterity Vest")
	}
	
	@Test
	func startingAtZero_day0() {
		let app = appWithDexterityVest(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithDexterityVest(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_decreases_by1_each_day() {
		let app = appWithDexterityVest(sellIn: 8, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 7, quality: 15, app)
		
		app.updateQuality()
		
		expect(sellIn: 6, quality: 14, app)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 13, app)
	}
	
	@Test
	func qualityDecreasesTwiceAsFastAfterSellDate() {
		let app = appWithDexterityVest(sellIn: 1, quality: 6)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 5, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 3, app)
		
		app.updateQuality()
		
		expect(sellIn: -2, quality: 1, app)
	}
	
	@Test
	func qualityNeverGoUnder0() {
		let app = appWithDexterityVest(sellIn: 5, quality: 1)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 0, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 0, app)
	}
}
