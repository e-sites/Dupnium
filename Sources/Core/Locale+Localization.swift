//
//  Locale+Localization.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 18-08-16.

import Foundation


extension Locale {
	public static func dutch() -> Locale {
		return Locale(identifier: "nl_NL")
	}
	
	public static func english() -> Locale {
		return Locale(identifier: "en_US")
	}
	
	public static func french() -> Locale {
		return Locale(identifier: "fr_FR")
	}
	
	public static func german() -> Locale {
		return Locale(identifier: "de_DE")
	}
	
	public static func italian() -> Locale {
		return Locale(identifier: "it_IT")
	}
	
	public static func swedish() -> Locale {
		return Locale(identifier: "se_SE")
	}
	
	public static func spanish() -> Locale {
		return Locale(identifier: "es_ES")
	}
}
