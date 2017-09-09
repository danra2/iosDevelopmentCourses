//
//  CircleButton.swift
//  Scribe
//
//  Created by Daniel Ra on 8/26/17.
//  Copyright © 2017 Daniel Ra. All rights reserved.
//

import UIKit

@IBDesignable

class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30 {
        didSet {
        setupView()
        }
    }
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius = cornerRadius
    }

}
