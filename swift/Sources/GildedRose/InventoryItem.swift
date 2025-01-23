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
	
	func updateQuality() -> Self
}

extension InventoryItem {
	func asItem() -> Item {
		.init(name: name, sellIn: sellIn, quality: quality)
	}
}
extension Item {
	func asInventoryItem() -> InventoryItem {
		if name == "Sulfuras, Hand of Ragnaros" {
			return SulfurasHandOfRagnaros(name: name, sellIn: sellIn, quality: quality)
		}
		
		if name == "Aged Brie" {
			return AgedBrie(name: name, sellIn: sellIn, quality: quality)
		}
		
		if name == "Backstage passes to a TAFKAL80ETC concert" {
			return BackstagePasses(name: name, sellIn: sellIn, quality: quality)
		}

		return GenericInventoryItem(name: name, sellIn: sellIn, quality: quality)
	}
}


