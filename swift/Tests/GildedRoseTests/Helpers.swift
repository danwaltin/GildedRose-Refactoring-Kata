//
//  Helpers.swift
//  GildedRose
//
//  Created by Dan Waltin on 2025-01-23.
//

import Foundation
@testable import GildedRose

import Testing

func expect(sellIn: Int,
			quality: Int,
			_ app: GildedRose,
			fileID: String = #fileID,
			filePath: String = #filePath,
			line: Int = #line,
			column: Int = #column) {
	
	let sourceLocation = SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
	
	#expect(app.items[0].sellIn == sellIn, sourceLocation: sourceLocation)
	#expect(app.items[0].quality == quality, sourceLocation: sourceLocation)
}

func expect(name: String,
			_ app: GildedRose,
			fileID: String = #fileID,
			filePath: String = #filePath,
			line: Int = #line,
			column: Int = #column) {
	
	let sourceLocation = SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
	
	#expect(app.items[0].name == name)
}

func appWithItem(_ item: Item) -> GildedRose {
	GildedRose(items: [item])
}

func agedBrie(sellIn: Int, quality: Int) -> Item {
	Item(name: "Aged Brie", sellIn: sellIn, quality: quality)
}

func backstagePasses(sellIn: Int, quality: Int) -> Item {
	Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: sellIn, quality: quality)
}

func dexterityVest(sellIn: Int, quality: Int) -> Item {
	Item(name: "+5 Dexterity Vest", sellIn: sellIn, quality: quality)
}

func elixirOfTheMongoose(sellIn: Int, quality: Int) -> Item {
	Item(name: "Elixir of the Mongoose", sellIn: sellIn, quality: quality)
}

func sulfuras(sellIn: Int, quality: Int) -> Item {
	Item(name: "Sulfuras, Hand of Ragnaros", sellIn: sellIn, quality: quality)
}
