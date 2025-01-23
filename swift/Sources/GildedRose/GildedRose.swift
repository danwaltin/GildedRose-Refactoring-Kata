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
			let inventoryItem = BackstagePasses(name: item.name, sellIn: item.sellIn, quality: item.quality)
			return inventoryItem.updateQuality().asItem()
		}

		let inventoryItem = GenericItem(name: item.name, sellIn: item.sellIn, quality: item.quality)
		return inventoryItem.updateQuality().asItem()
	}
}
