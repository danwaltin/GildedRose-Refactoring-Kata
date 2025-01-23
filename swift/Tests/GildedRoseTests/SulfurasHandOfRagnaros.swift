@testable import GildedRose
import Testing

struct SulfurasHandOfRagnaros {
	private func appWithSulfurasHandOfRagnaros(sellIn: Int, quality: Int) -> GildedRose {
		let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: sellIn, quality: quality)]
		return GildedRose(items: items)
	}
	
	@Test
	func nameIsSame() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 5, quality: 5)
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
		
		app.updateQuality()
		
		#expect(app.items[0].name == "Sulfuras, Hand of Ragnaros")
	}
	
	@Test
	func startingAtZero_day0() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 0, quality: 80)
		
		expect(sellIn: 0, quality: 80, app)
	}
	
	@Test
	func sellInAndQualityNeverDecreases() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 8, quality: 80)
		
		app.updateQuality()
		
		expect(sellIn: 8, quality: 80, app)
		
		app.updateQuality()
		
		expect(sellIn: 8, quality: 80, app)
	}
	
	@Test
	func qualityAfterSellDate() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 1, quality: 80)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 80, app)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 80, app)
	}

	@Test
	func requirementsSaysQualityIsAlways80ButCanActuallyStartAsAnything() {
		let app = appWithSulfurasHandOfRagnaros(sellIn: 1, quality: 70)
		
		expect(sellIn: 1, quality: 70, app)

		app.updateQuality()
		
		expect(sellIn: 1, quality: 70, app)
		
		app.updateQuality()
		
		expect(sellIn: 1, quality: 70, app)
	}
}
