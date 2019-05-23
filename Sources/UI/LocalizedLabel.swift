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

    public var dupnium = Dupnium.shared

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
        _setLocalizedText(text)
    }

    // MARK: - Set
    // --------------------------------------------------------

    private func _setLocalizedText(_ string: String?) {
        if let string = string, let locString = dupnium.getString(string) {
            text = locString
        }
    }
}
