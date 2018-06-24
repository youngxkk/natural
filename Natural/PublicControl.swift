//
//  PublicControl.swift
//  Natural
//
//  Created by youngxkk on 2018/6/24.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import Foundation
import UIKit

class PublicControl: UIViewController {
    

        
        func mainLabel(cg: CGRect, font: CGFloat, textAlignment:NSTextAlignment, textColor: UIColor, text:String) ->UILabel{
        let textLabel = UILabel.init()
        textLabel.frame = CGRect(x: 0, y: 540, width: self.view.frame.width, height: 50)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.textColor = UIColor.white
        textLabel.alpha = 0.5
        textLabel.text = "Beach"
        view.addSubview(textLabel)
        return textLabel
        }


}
