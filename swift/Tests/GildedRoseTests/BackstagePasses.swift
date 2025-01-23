@testable import GildedRose
import Testing

struct BackstagePasses {
	private func appWithBackstagePasses(sellIn: Int, quality: Int) -> GildedRose {
		appWithItem(backstagePasses(sellIn: sellIn, quality: quality))
	}
	
	@Test
	func name_is_same() {
		let app = appWithBackstagePasses(sellIn: 5, quality: 5)
		
		expect(name: "Backstage passes to a TAFKAL80ETC concert", app)
		
		app.updateQuality()

		expect(name: "Backstage passes to a TAFKAL80ETC concert", app)
		
		app.updateQuality()
		
		expect(name: "Backstage passes to a TAFKAL80ETC concert", app)
	}
	
	@Test
	func starting_at_zero_day0() {
		let app = appWithBackstagePasses(sellIn: 0, quality: 0)
		
		expect(sellIn: 0, quality: 0, app)
	}
	
	@Test
	func sellIn_quality_different_day0() {
		let app = appWithBackstagePasses(sellIn: 8, quality: 16)
		
		expect(sellIn: 8, quality: 16, app)
	}
	
	@Test
	func sellIn_and_quality_increases_by_1_each_day_when_more_than_10_days_left() {
		let app = appWithBackstagePasses(sellIn: 13, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 12, quality: 17, app)
		
		app.updateQuality()
		
		expect(sellIn: 11, quality: 18, app)
	}

	@Test
	func sellIn_and_quality_increases_by_2_each_day_when_10_days_or_less_left() {
		let app = appWithBackstagePasses(sellIn: 11, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 10, quality: 17, app)
		
		app.updateQuality()
		
		expect(sellIn: 9, quality: 19, app)

		app.updateQuality()
		
		expect(sellIn: 8, quality: 21, app)
	}

	@Test
	func sellIn_and_quality_increases_by_3_each_day_when_5_days_or_less_left() {
		let app = appWithBackstagePasses(sellIn: 6, quality: 16)
		
		app.updateQuality()
		
		expect(sellIn: 5, quality: 18, app)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 21, app)

		app.updateQuality()
		
		expect(sellIn: 3, quality: 24, app)
	}
	
	@Test
	func quality_drops_to_0_after_sell_date() {
		let app = appWithBackstagePasses(sellIn: 1, quality: 6)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 9, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 0, app)
		
	}
	
	@Test
	func quality_never_go_above_50_before_sellDate() {
		let app = appWithBackstagePasses(sellIn: 5, quality: 49)
		
		app.updateQuality()
		
		expect(sellIn: 4, quality: 50, app)
		
		app.updateQuality()
		
		expect(sellIn: 3, quality: 50, app)
	}
	
	@Test
	func quality_drops_from_50_to_0_after_sellDate() {
		let app = appWithBackstagePasses(sellIn: 1, quality: 48)
		
		app.updateQuality()
		
		expect(sellIn: 0, quality: 50, app)
		
		app.updateQuality()
		
		expect(sellIn: -1, quality: 0, app)
	}
}
