public class GildedRose {
	var items: [Item]
	
	public init(items: [Item]) {
		self.items = items
	}
	
	public func updateQuality() {
		items = items.map { updateItem($0)}
	}
	
	private func updateItem(_ item: Item) -> Item {
		var updated = item

		if updated.name == "Sulfuras, Hand of Ragnaros" {
			return updated
		}
		
		if updated.name == "Aged Brie" {
			if updated.quality < 50 {
				updated.quality = updated.quality + 1
			}
			
			updated.sellIn = updated.sellIn - 1
			
			if updated.sellIn < 0 {
				if updated.quality < 50 {
					updated.quality = updated.quality + 1
				}
			}
			return updated

		} else if updated.name == "Backstage passes to a TAFKAL80ETC concert" {
			if updated.quality < 50 {
				updated.quality = updated.quality + 1
				
				if updated.name == "Backstage passes to a TAFKAL80ETC concert" {
					if updated.sellIn < 11 {
						if updated.quality < 50 {
							updated.quality = updated.quality + 1
						}
					}
					
					if updated.sellIn < 6 {
						if updated.quality < 50 {
							updated.quality = updated.quality + 1
						}
					}
				}
			}

		} else {
			if updated.quality > 0 {
				updated.quality = updated.quality - 1
			}
		}
		
		updated.sellIn = updated.sellIn - 1
		
		if updated.sellIn < 0 {
				if updated.name == "Backstage passes to a TAFKAL80ETC concert" {
					updated.quality = 0
				} else {
					if updated.quality > 0 {
						updated.quality = updated.quality - 1
					}
				}
		}
		return updated
	}
}
