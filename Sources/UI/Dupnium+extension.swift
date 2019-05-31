//
//  Dupnium+extension.swift
//  Dupnium
//
//  Created by Bas van Kuijck on 31/05/2019.
//  Copyright © 2019 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension Dupnium {
    public func reloadLocalizations() {
        NotificationCenter.default.post(name: Constants.localeChangedNotificationName, object: self, userInfo: [ "locale": locale ])
    }
}
