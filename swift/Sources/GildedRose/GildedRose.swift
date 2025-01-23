public class GildedRose {
	var items: [Item]
	
	public init(items: [Item]) {
		self.items = items
	}
	
	public func updateQuality() {
		items = items.map { updateItem($0)}
	}
	
	private func updateItem(_ item: Item) -> Item {
		return item.asInventoryItem().updateQuality().asItem()
	}
}
