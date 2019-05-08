//
//  Dupnium.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation

open class Dupnium {
    private enum Constants {
        fileprivate static let userDefaultsLocaleKey = "userDefaultsLocaleKey"
    }
    
    public static let shared = Dupnium()
    open var debugModus = false
    
    open var fallbackLocale: Locale = Locale.current {
        didSet {
            if _getBundle(locale: fallbackLocale) == nil {
                fatalError("[Localization] Cannot find '\(language).lproj/Localizable.strings' for `fallBackLocale`")
            }
        }
    }
    
    open var locale: Locale = Locale.current {
        didSet {
            self._update()
        }
    }
    
    public init() {
        defer {
            #if DEBUG
                self.debugModus = true
            #endif
            
            if let identifier = UserDefaults.standard.string(forKey: Constants.userDefaultsLocaleKey) {
                self.locale = Locale(identifier:  identifier)
            }
            self._update()
        }
    }
    
    open fileprivate(set) var bundle: Bundle = Bundle.main
    
    open var language: String {
        return locale.identifier.components(separatedBy: "_").first ?? "en"
    }
    
    private func _getBundle(locale: Locale) -> Bundle? {
        guard let language = locale.identifier.components(separatedBy: "_").first else {
            return nil
        }
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            return nil
        }
        
        return Bundle(path: path)
    }
    
    fileprivate func _update() {
        guard let bundle = _getBundle(locale: locale) else {
            if locale != fallbackLocale {
                let l = language
                locale = fallbackLocale
                if debugModus {
                    NSLog("[Dubnium] Cannot find '\(l).lproj/Localizable.strings', using `\(language).lproj/Localizable.strings` instead")
                }
            }
            return
        }
        self.bundle = bundle
        
        UserDefaults.standard.set(locale.identifier, forKey: Constants.userDefaultsLocaleKey)
    }
    
    open subscript(key: String) -> String {
        return string(key)
    }
    
    open func string(_ key: String) -> String {
        let model = UIDevice.current.model
        if model == "iPad" || model == "iPad Simulator" {
            let ipadKey = key + "~ipad"
            if let ipadStr = getString(ipadKey) {
                return ipadStr
            }
        }
        
        guard let str = getString(key) else {
            let sk = key.replacingOccurrences(of: "%", with: "%%")
            if debugModus {
                NSLog("[Dubnium] Cannot find localization for '\(sk)' in '\(language).lproj/Localizable.strings'")
            }
            return ""
        }
        return str
    }

    @objc
    open func getString(_ key: String) -> String? {
        return bundle.localizedString(forKey: key, value: nil, table: nil)
    }

    open subscript(key: String, value: Int) -> String {
        return plural(key, value: value)
    }

    open subscript(key: String, value: Double) -> String {
        return plural(key, value: value)
    }

    open func plural(_ key: String, value: Double) -> String {
        let form = PluralForm.getForm(self.language, n: value)
        let keyVariant = String(format: "%@##{%@}", key, form.rawValue)
        let format = self[keyVariant]
        return String(format: format, value)
    }

    open func plural(_ key: String, value: Int) -> String {
        let form = PluralForm.getForm(self.language, n: Double(value))
        let keyVariant = String(format: "%@##{%@}", key, form.rawValue)
        let format = self[keyVariant]
        return String(format: format, value)
    }

    
    open func data(fromResourceName name: String, withExtension ext: String) -> Data? {
        guard let path = self.bundle.path(forResource: name, ofType: ext) else {
            return nil
        }
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    open func image(named name: String, withExtension ext: String = "png") -> UIImage? {
        guard let path = self.bundle.path(forResource: name, ofType: ext) else {
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
}
