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
