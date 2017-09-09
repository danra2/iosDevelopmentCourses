//
//  cancelButtonDelegate.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/23/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//

import UIKit
protocol CancelButtonDelegate: class {
    func cancelButtonPressedFrom(_ controller: UIViewController)
}
