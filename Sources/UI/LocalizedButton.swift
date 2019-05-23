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

    public var dupnium = Dupnium.shared

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
        _setLocalizedTitle(title, for: state)
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
            setTitle(locString, for: .normal)
        }
    }

}
