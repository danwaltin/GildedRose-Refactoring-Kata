@testable import GildedRose
import Testing

struct Conjured {
	private func appWithConjured(sellIn: Int, quality: Int) -> GildedRose {
		appWithItem(conjured(sellIn: sellIn, quality: quality))
	}
	
	@Test
	func name_is_same() {
		let app = appWithConjured(sellIn: 5, quality: 5)
		
		expect(name: "Conjured", app)
		
		app.updateQuality()
		
		expect(name: "Conjured", app)
		
		app.updateQuality()
		
		expect(name: "Conjured", app)
	}
	
	@Test
	func starting_at_zero_day0() {
		let app = appWithConjured(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithConjured(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_decreases_by_2_each_day() {
		let app = appWithConjured(sellIn: 8, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 7, quality: 14, app)
		
		app.updateQuality()
		
		expect(sellIn: 6, quality: 12, app)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 10, app)
	}
	
	@Test
	func quality_decreases_twice_as_fast_after_sell_date() {
		let app = appWithConjured(sellIn: 1, quality: 12)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 10, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 6, app)
		
		app.updateQuality()
		
		expect(sellIn: -2, quality: 2, app)
	}
	
	@Test
	func quality_never_fall_below_0() {
		let app = appWithConjured(sellIn: 5, quality: 1)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 0, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 0, app)
	}
}
