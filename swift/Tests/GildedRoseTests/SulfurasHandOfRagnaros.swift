@testable import GildedRose
import Testing

struct SulfurasHandOfRagnaros {
	private func appWithSulfurasHandOfRagnaros(sellIn: Int, quality: Int) -> GildedRose {
		let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: sellIn, quality: quality)]
		return GildedRose(items: items)
	}
	
	@Test
	func name_is_same() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 5, quality: 5)
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
	}
	
	@Test
	func starting_at_zero_day0() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 0, quality: 80)
		
		expect(sellIn: 0, quality: 80, app)
	}
	
	@Test
	func sellIn_and_quality_never_decreases() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 8, quality: 80)
		
		app.updateQuality()
		
		expect(sellIn: 8, quality: 80, app)
		
		app.updateQuality()
		
		expect(sellIn: 8, quality: 80, app)
	}
	
	@Test
	func quality_after_sellDate() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 1, quality: 80)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 80, app)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 80, app)
	}

	@Test
	func requirements_says_quality_is_always_80_but_can_actually_start_as_anything() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 1, quality: 70)
		
		expect(sellIn: 1, quality: 70, app)

		app.updateQuality()
		
		expect(sellIn: 1, quality: 70, app)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 70, app)
	}
}
