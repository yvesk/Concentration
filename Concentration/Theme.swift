//
//  Theme.swift
//  Concentration
//
//  Created by Yves Kurz on 13.08.18.
//  Copyright © 2018 Yves Kurz. All rights reserved.
//

import Foundation
import UIKit

protocol Theme {
    var viewBackgrundColor: UIColor { get }
    var cardColor: UIColor { get }
    var cardFaces: [String] { get }
}
