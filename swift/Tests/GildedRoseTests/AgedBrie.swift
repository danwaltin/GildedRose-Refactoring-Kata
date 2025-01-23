@testable import GildedRose
import Testing

struct AgedBrie {
	
	private func appWithAgedBrie(sellIn: Int, quality: Int) -> GildedRose {
		let items = [Item(name: "Aged Brie", sellIn: sellIn, quality: quality)]
		return GildedRose(items: items)
	}
	
	@Test
	func name_is_same() {
		let app = appWithAgedBrie(sellIn: 5, quality: 5)
		
		#expect(app.items[0].name == "Aged Brie")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Aged Brie")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Aged Brie")
	}
	
	@Test
	func starting_at_zero_day0() {
		let app = appWithAgedBrie(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithAgedBrie(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_increases_by_1_each_day() {
		let app = appWithAgedBrie(sellIn: 8, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 7, quality: 17, app)
		
		app.updateQuality()
		
		expect(sellIn: 6, quality: 18, app)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 19, app)
	}
	
	@Test
	func quality_increases_twice_as_fast_after_sell_date() {
		let app = appWithAgedBrie(sellIn: 1, quality: 6)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 7, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 9, app)
		
		app.updateQuality()
		
		expect(sellIn: -2, quality: 11, app)
	}
	
	@Test
	func quality_never_go_above_50_before_sellDate() {
		let app = appWithAgedBrie(sellIn: 5, quality: 49)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 50, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 50, app)
	}
	
	@Test
	func quality_never_go_above_50_after_sellDate() {
		let app = appWithAgedBrie(sellIn: 1, quality: 48)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 49, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 50, app)

		app.updateQuality()
		
		expect(sellIn: -2, quality: 50, app)
	}
}


