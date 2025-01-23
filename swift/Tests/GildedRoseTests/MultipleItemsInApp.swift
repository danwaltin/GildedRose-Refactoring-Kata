import Foundation
import Testing

struct MultipleItemsInApp {

	@Test
	func name_is_same() {
		let app = appWithItems([
			dexterityVest(sellIn: 10, quality: 20),
			agedBrie(sellIn: 2, quality: 0),
			elixirOfTheMongoose(sellIn: 5, quality: 7),
			sulfuras(sellIn: 0, quality: 80),
			sulfuras(sellIn: -1, quality: 80),
			backstagePasses(sellIn: 15, quality: 20),
			backstagePasses(sellIn: 10, quality: 49),
			backstagePasses(sellIn: 5, quality: 49),
		])
		
		expect(item: 0, name: "+5 Dexterity Vest", app)
		expect(item: 1, name: "Aged Brie", app)
		expect(item: 2, name: "Elixir of the Mongoose", app)
		expect(item: 3, name: "Sulfuras, Hand of Ragnaros", app)
		expect(item: 4, name: "Sulfuras, Hand of Ragnaros", app)
		expect(item: 5, name: "Backstage passes to a TAFKAL80ETC concert", app)
		expect(item: 6, name: "Backstage passes to a TAFKAL80ETC concert", app)
		expect(item: 7, name: "Backstage passes to a TAFKAL80ETC concert", app)
		
		app.updateQuality()
		
		expect(item: 0, name: "+5 Dexterity Vest", app)
		expect(item: 1, name: "Aged Brie", app)
		expect(item: 2, name: "Elixir of the Mongoose", app)
		expect(item: 3, name: "Sulfuras, Hand of Ragnaros", app)
		expect(item: 4, name: "Sulfuras, Hand of Ragnaros", app)
		expect(item: 5, name: "Backstage passes to a TAFKAL80ETC concert", app)
		expect(item: 6, name: "Backstage passes to a TAFKAL80ETC concert", app)
		expect(item: 7, name: "Backstage passes to a TAFKAL80ETC concert", app)
	}

	@Test
	func day_1() {
		let app = appWithItems([
			dexterityVest(      sellIn: 10, quality: 20),
			agedBrie(           sellIn:  2, quality:  0),
			elixirOfTheMongoose(sellIn:  5, quality:  7),
			sulfuras(           sellIn:  0, quality: 80),
			sulfuras(           sellIn: -1, quality: 80),
			backstagePasses(    sellIn: 15, quality: 20),
			backstagePasses(    sellIn: 10, quality: 49),
			backstagePasses(    sellIn:  5, quality: 49),
		])
		
		app.updateQuality()
		
		expect(item: 0, sellIn:  9, quality: 19, app)
		expect(item: 1, sellIn:  1, quality:  1, app)
		expect(item: 2, sellIn:  4, quality:  6, app)
		expect(item: 3, sellIn:  0, quality: 80, app)
		expect(item: 4, sellIn: -1, quality: 80, app)
		expect(item: 5, sellIn: 14, quality: 21, app)
		expect(item: 6, sellIn:  9, quality: 50, app)
		expect(item: 7, sellIn:  4, quality: 50, app)
	}

	@Test
	func day_2() {
		let app = appWithItems([
			dexterityVest(      sellIn: 10, quality: 20),
			agedBrie(           sellIn:  2, quality:  0),
			elixirOfTheMongoose(sellIn:  5, quality:  7),
			sulfuras(           sellIn:  0, quality: 80),
			sulfuras(           sellIn: -1, quality: 80),
			backstagePasses(    sellIn: 15, quality: 20),
			backstagePasses(    sellIn: 10, quality: 49),
			backstagePasses(    sellIn:  5, quality: 49),
		])
		
		app.updateQuality()
		app.updateQuality()
		
		expect(item: 0, sellIn:  8, quality: 18, app)
		expect(item: 1, sellIn:  0, quality:  2, app)
		expect(item: 2, sellIn:  3, quality:  5, app)
		expect(item: 3, sellIn:  0, quality: 80, app)
		expect(item: 4, sellIn: -1, quality: 80, app)
		expect(item: 5, sellIn: 13, quality: 22, app)
		expect(item: 6, sellIn:  8, quality: 50, app)
		expect(item: 7, sellIn:  3, quality: 50, app)
	}

	@Test
	func day_10() {
		let app = appWithItems([
			dexterityVest(      sellIn: 10, quality: 20),
			agedBrie(           sellIn:  2, quality:  0),
			elixirOfTheMongoose(sellIn:  5, quality:  7),
			sulfuras(           sellIn:  0, quality: 80),
			sulfuras(           sellIn: -1, quality: 80),
			backstagePasses(    sellIn: 15, quality: 20),
			backstagePasses(    sellIn: 10, quality: 49),
			backstagePasses(    sellIn:  5, quality: 49),
		])
		
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		app.updateQuality()
		
		expect(item: 0, sellIn:  0, quality: 10, app)
		expect(item: 1, sellIn: -8, quality: 18, app)
		expect(item: 2, sellIn: -5, quality:  0, app)
		expect(item: 3, sellIn:  0, quality: 80, app)
		expect(item: 4, sellIn: -1, quality: 80, app)
		expect(item: 5, sellIn:  5, quality: 35, app)
		expect(item: 6, sellIn:  0, quality: 50, app)
		expect(item: 7, sellIn: -5, quality:  0, app)
	}
}
