public class GildedRose {
	var items: [Item]
	
	public init(items: [Item]) {
		self.items = items
	}
	
	public func updateQuality() {
		items = items.map { updateItem($0)}
	}
	
	private func updateItem(_ item: Item) -> Item {
		
		if item.name == "Sulfuras, Hand of Ragnaros" {
			let inventoryItem = SulfurasHandOfRagnaros(name: item.name, sellIn: item.sellIn, quality: item.quality)
			return inventoryItem.updateQuality().asItem()
		}
		
		if item.name == "Aged Brie" {
			let inventoryItem = AgedBrie(name: item.name, sellIn: item.sellIn, quality: item.quality)
			return inventoryItem.updateQuality().asItem()
		}
		
		if item.name == "Backstage passes to a TAFKAL80ETC concert" {
			return updateBackstagePasses(item)
		}

		let inventoryItem = GenericItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
		return inventoryItem.updateQuality().asItem()
	}
		
	private func updateBackstagePasses(_ item: Item) -> Item {
		let updated = item
		updated.sellIn = updated.sellIn - 1

		
		if updated.sellIn < 5 {
			updated.quality = updated.quality + 3
		} else if updated.sellIn < 10 {
			updated.quality = updated.quality + 2
		} else {
			updated.quality = updated.quality + 1
		}

		if updated.quality > 50 {
			updated.quality = 50
		}
		
		if updated.sellIn < 0 {
			updated.quality = 0
		}
		
		return updated
	}
}
