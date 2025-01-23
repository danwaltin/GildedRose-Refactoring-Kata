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
		GenericItem(name: "", sellIn: 0, quality: 0)
	}
}

struct AgedBrie : InventoryItem {
	func asItem() -> Item {
		return .init(name: "", sellIn: 0, quality: 0)
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
		return .init(name: "", sellIn: 0, quality: 0)
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
		return .init(name: name, sellIn: sellIn, quality: quality)
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
		return .init(name: "", sellIn: 0, quality: 0)
	}

	func updateQuality() -> GenericItem {
		return self
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}
