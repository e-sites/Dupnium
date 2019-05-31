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

    private var _title: String?

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

        let title = super.title(for: .normal)
        _title = title
        setup(title)
        _setListener()
    }

    open func setup(_ title: String?) {
        _setLocalizedTitle(title, for: state)
    }

    private func _setListener() {
        NotificationCenter.default.removeObserver(self, name: Dupnium.Constants.localeChangedNotificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(_updateNotificationCenter(_:)), name: Dupnium.Constants.localeChangedNotificationName, object: dupnium)
    }

    // MARK: - Title
    // --------------------------------------------------------

    override open func setTitle(_ title: String?, for state: UIControl.State) {
        _title = title
        super.setTitle(title, for: .normal)
    }

    override open func title(for state: UIControl.State) -> String? {
        return _title
    }

    private func _setLocalizedTitle(_ title: String?, for state: UIControl.State) {
        if let string = title, let locString = dupnium.getString(string) {
            if string != locString {
                _dupniumKey = string
            }
            setTitle(locString, for: .normal)
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
