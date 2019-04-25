//
//  ArticleStyleLoader.swift
//  Vienna
//
//  Copyright 2019
//

import Foundation

class ArticleStyleLoader: NSObject {

	private static var loaded = false

	private static var styles: NSMutableDictionary = NSMutableDictionary()

	@objc static var stylesMap: NSMutableDictionary {
		return loaded ? styles : reloadStylesMap()
	}

	@objc
	static func reloadStylesMap() -> NSMutableDictionary {
		let path = URL(string: Bundle.main.sharedSupportPath ?? "")?.appendingPathComponent("Styles").absoluteString
		loadMapFromPath(path, styles, true, nil)
		loadMapFromPath(Preferences.standard().stylesFolder, styles, true, nil)

		loaded = true

		return styles
	}
}
