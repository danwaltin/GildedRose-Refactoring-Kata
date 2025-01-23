@testable import GildedRose
import Testing

struct ElixirOfTheMongoose {
	
	private func appWithElixitOfTheMongoose(sellIn: Int, quality: Int) -> GildedRose {
		let items = [Item(name: "Elixir of the Mongoose", sellIn: sellIn, quality: quality)]
		return GildedRose(items: items)
	}
	
	@Test
	func nameIsSame() {
		let app = appWithElixitOfTheMongoose(sellIn: 5, quality: 5)
		
		#expect(app.items[0].name == "Elixir of the Mongoose")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Elixir of the Mongoose")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Elixir of the Mongoose")
	}
	
	@Test
	func startingAtZero_day0() {
		let app = appWithElixitOfTheMongoose(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithElixitOfTheMongoose(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_decreases_by1_each_day() {
		let app = appWithElixitOfTheMongoose(sellIn: 8, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 7, quality: 15, app)
		
		app.updateQuality()
		
		expect(sellIn: 6, quality: 14, app)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 13, app)
	}
	
	@Test
	func qualityDecreasesTwiceAsFastAfterSellDate() {
		let app = appWithElixitOfTheMongoose(sellIn: 1, quality: 6)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 5, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 3, app)
		
		app.updateQuality()
		
		expect(sellIn: -2, quality: 1, app)
	}
	
	@Test
	func qualityNeverGoUnder0() {
		let app = appWithElixitOfTheMongoose(sellIn: 5, quality: 1)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 0, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 0, app)
	}
}
