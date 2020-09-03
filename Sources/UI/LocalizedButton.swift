//
//  LocalizedButton.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 02/05/2019.
//  Copyright © 2019 E-sites. All rights reserved.
//

import Foundation
import UIKit

open class LocalizedButton: UIButton {

    private var _dupniumKey: String?

    public var dupnium = Dupnium.shared {
        didSet {
            _setListener()
        }
    }

    @IBInspectable public var autoUpdate: Bool = true

    private var _titlesMap: [UIControl.State.RawValue: String?] = [:]

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

        _titlesMap[UIControl.State.normal.rawValue] = super.title(for: .normal)
        _titlesMap[UIControl.State.disabled.rawValue] = super.title(for: .disabled)
        _titlesMap[UIControl.State.highlighted.rawValue] = super.title(for: .highlighted)
        _titlesMap[UIControl.State.selected.rawValue] = super.title(for: .selected)
        setup()
        _setListener()
    }

    open func setup() {
        _setLocalizedTitle(title(for: state), for: state)
    }

    private func _setListener() {
        NotificationCenter.default.removeObserver(self, name: Dupnium.Constants.localeChangedNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_updateNotificationCenter(_:)), name: Dupnium.Constants.localeChangedNotificationName, object: dupnium)
    }

    // MARK: - Title
    // --------------------------------------------------------

    override open func setTitle(_ title: String?, for state: UIControl.State) {
        _titlesMap[state.rawValue] = title
        super.setTitle(title, for: state)
    }

    override open func title(for state: UIControl.State) -> String? {
        return _titlesMap[state.rawValue] ?? nil
    }

    private func _setLocalizedTitle(_ title: String?, for state: UIControl.State) {
        if let string = title, let locString = dupnium.getString(string) {
            if string != locString {
                _dupniumKey = string
            }
            setTitle(locString, for: state)
        }
    }

    @objc
    private func _updateNotificationCenter(_ notification: Notification) {
        guard let key = _dupniumKey, autoUpdate, let string = dupnium.getString(key) else {
            return
        }
        setTitle(string, for: .normal)
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: Dupnium.Constants.localeChangedNotificationName, object: nil)
    }
}
