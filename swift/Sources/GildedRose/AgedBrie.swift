//
//  AgedBrie.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//


import Foundation

struct AgedBrie : InventoryItem {
	func updateQuality() -> AgedBrie {
		let newSellIn = sellIn - 1

		var newQuality = quality
		
		if newSellIn >= 0 {
			newQuality = quality + 1
		} else {
			newQuality = quality + 2
		}

		if newQuality > 50 {
			newQuality = 50
		}
		return .init(name: name, sellIn: newSellIn, quality: newQuality)
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}
