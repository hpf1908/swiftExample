//
//  TestXibControllerTestStoryboardController.swift
//  swiftExample
//
//  Created by pengfei huang on 14-6-27.
//  Copyright (c) 2014年 pengfei huang. All rights reserved.
//

import Foundation
import UIKit

class TestStoryboardController: UIViewController {
    
    @IBOutlet var button: UIButton
    @IBOutlet var imageView: UIImageView
    
    @IBInspectable var integer: Int = 0
    
    @IBAction func buttonTapped(AnyObject) {
        println("button tapped!")
    }
}

class TestXibController: UIViewController {
  
}