//
//  BackstagePasses.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//


import Foundation

struct BackstagePasses : InventoryItem {
	func updateQuality() -> BackstagePasses {
		let newSellIn = sellIn - 1

		var newQuality = quality
		if newSellIn < 5 {
			newQuality = quality + 3
		} else if newSellIn < 10 {
			newQuality = quality + 2
		} else {
			newQuality = quality + 1
		}

		if newQuality > 50 {
			newQuality = 50
		}
		
		if newSellIn < 0 {
			newQuality = 0
		}

		return .init(name: name, sellIn: newSellIn, quality: newQuality)
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}