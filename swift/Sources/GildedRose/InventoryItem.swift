//
//  InventoryItem.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//

import Foundation

protocol InventoryItem {
	var name: String { get }
	var sellIn: Int { get }
	var quality: Int  { get }
	
	func asItem() -> Item
	func updateQuality() -> Self
}

extension Item {
	func asInventoryItem() -> InventoryItem {
		GenericItem(name: name, sellIn: sellIn, quality: quality)
	}
}

struct AgedBrie : InventoryItem {
	func asItem() -> Item {
		.init(name: name, sellIn: sellIn, quality: quality)
	}
	
	func updateQuality() -> AgedBrie {
		return self
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}

struct BackstagePasses : InventoryItem {
	func asItem() -> Item {
		.init(name: name, sellIn: sellIn, quality: quality)
	}

	func updateQuality() -> BackstagePasses {
		return self
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}

struct SulfurasHandOfRagnaros : InventoryItem {
	func asItem() -> Item {
		.init(name: name, sellIn: sellIn, quality: quality)
	}

	func updateQuality() -> SulfurasHandOfRagnaros {
		return self
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}

struct GenericItem : InventoryItem {
	func asItem() -> Item {
		.init(name: name, sellIn: sellIn, quality: quality)
	}

	func updateQuality() -> GenericItem {
		let newSellIn = sellIn - 1
		
		var newQuality = quality
		if newSellIn >= 0 {
			newQuality = quality - 1
		} else {
			newQuality = quality - 2
		}

		if newQuality < 0 {
			newQuality = 0
		}

		return .init(name: name, sellIn: newSellIn, quality: newQuality)
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}
