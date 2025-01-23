//
//  NormalInventoryItem.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//


import Foundation

struct NormalInventoryItem : InventoryItem {
	func updateQuality() -> NormalInventoryItem {
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
