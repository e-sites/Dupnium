//
//  LocalizedLabel.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 02/05/2019.
//  Copyright © 2019 E-sites. All rights reserved.
//

import Foundation
import UIKit

open class LocalizedLabel: UILabel {

    private var _dupniumKey: String?

    public var dupnium = Dupnium.shared {
        didSet {
            _setListener()
        }
    }

    @IBInspectable public var autoUpdate: Bool = true

    // MARK: - Initialization
    // --------------------------------------------------------

    convenience public init() {
        self.init(frame: CGRect.zero)
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup(text)
        _setListener()
    }

    open func setup(_ text: String?) {
        _setLocalizedText(text)
    }

    // MARK: - Set
    // --------------------------------------------------------

    private func _setLocalizedText(_ string: String?) {
        if let string = string, let locString = dupnium.getString(string) {
            if string != locString {
                _dupniumKey = string
            }
            text = locString
        }
    }

    private func _setListener() {
        NotificationCenter.default.removeObserver(self, name: Dupnium.Constants.localeChangedNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_updateNotificationCenter(_:)), name: Dupnium.Constants.localeChangedNotificationName, object: dupnium)
    }

    @objc
    private func _updateNotificationCenter(_ notification: Notification) {
        guard let key = _dupniumKey, autoUpdate, let string = dupnium.getString(key) else {
            return
        }
        text = string
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Dupnium.Constants.localeChangedNotificationName, object: nil)
    }
}
