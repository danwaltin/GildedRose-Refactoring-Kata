@testable import GildedRose
import Testing

struct ElixirOfTheMongoose {
	private func appWithElixirOfTheMongoose(sellIn: Int, quality: Int) -> GildedRose {
		appWithItem(elixirOfTheMongoose(sellIn: sellIn, quality: quality))
	}
	
	@Test
	func name_is_same() {
		let app = appWithElixirOfTheMongoose(sellIn: 5, quality: 5)
		
		expect(name: "Elixir of the Mongoose", app)
		
		app.updateQuality()
		
		expect(name: "Elixir of the Mongoose", app)

		app.updateQuality()
		
		expect(name: "Elixir of the Mongoose", app)
	}
	
	@Test
	func starting_at_zero_day0() {
		let app = appWithElixirOfTheMongoose(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithElixirOfTheMongoose(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_decreases_by_1_each_day() {
		let app = appWithElixirOfTheMongoose(sellIn: 8, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 7, quality: 15, app)
		
		app.updateQuality()
		
		expect(sellIn: 6, quality: 14, app)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 13, app)
	}
	
	@Test
	func quality_decreases_twice_as_fast_after_sell_date() {
		let app = appWithElixirOfTheMongoose(sellIn: 1, quality: 6)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 5, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 3, app)
		
		app.updateQuality()
		
		expect(sellIn: -2, quality: 1, app)
	}
	
	@Test
	func quality_will_never_fall_below_0() {
		let app = appWithElixirOfTheMongoose(sellIn: 5, quality: 1)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 0, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 0, app)
	}
}
