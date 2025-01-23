//
//  SulfurasHandOfRagnaros.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//


import Foundation

struct SulfurasHandOfRagnaros : InventoryItem {
	func updateQuality() -> SulfurasHandOfRagnaros {
		return self
	}
	
	let name: String
	let sellIn: Int
	let quality: Int
}