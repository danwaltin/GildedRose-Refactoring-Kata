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
			return updateSulfuras(item)
		}
		
		if item.name == "Aged Brie" {
			return updateAgedBrie(item)
		}
		
		if item.name == "Backstage passes to a TAFKAL80ETC concert" {
			return updateBackstagePasses(item)
		}

		return updateGeneric(item)
	}
	
	private func updateAgedBrie(_ item: Item) -> Item {

		let updated = item

		updated.sellIn = updated.sellIn - 1

		if updated.sellIn >= 0 {
			updated.quality = updated.quality + 1
		} else {
			updated.quality = updated.quality + 2
		}

		if updated.quality > 50 {
			updated.quality = 50
		}

		return updated
	}
	
	private func updateSulfuras(_ item: Item) -> Item {
		return item
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
	
	private func updateGeneric(_ item: Item) -> Item {
		let updated = item
		
		updated.sellIn = updated.sellIn - 1
		
		if updated.sellIn >= 0 {
			updated.quality = updated.quality - 1
		} else {
			updated.quality = updated.quality - 2
		}

		if updated.quality < 0 {
			updated.quality = 0
		}

		return updated
	}
}
