// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var label = UILabel(frame:CGRectMake(0, 0, 200, 100));
label.text = str;

var label1 = UILabel(frame:CGRectMake(0, 0, 200, 100));
label.text = "test";

var image = UIImage(contentsOfFile: "/Users/hpf1908/projects/object-c/swiftExample/swiftExample/Resources/ie.jpg");

var btn = UIButton(frame: CGRectMake(0, 150, 300, 300));

btn.setBackgroundImage(image, forState: .Normal)