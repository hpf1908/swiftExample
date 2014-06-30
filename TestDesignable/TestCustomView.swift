//
//  TestCustomView.swift
//  swiftExample
//
//  Created by pengfei huang on 14-6-30.
//  Copyright (c) 2014年 pengfei huang. All rights reserved.
//

import UIKit

@IBDesignable class TestCustomView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
    didSet {
        layer.borderColor = borderColor.CGColor
    }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
        layer.borderWidth = borderWidth
    }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
        layer.cornerRadius = cornerRadius
    }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
