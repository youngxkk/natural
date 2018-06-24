//
//  Page2.swift
//  Natural
//
//  Created by youngxkk on 2018/6/23.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import UIKit

class Page2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let img = UIImage(named: "pic_summer_night")
        let imgView = UIImageView(image: img)
        self.view.addSubview(imgView)
//        view.backgroundColor = UIColor.yellow
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: 540, width: self.view.frame.width, height: 50))
        
        textLabel.text = "Summer night"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        textLabel.alpha = 0.5
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = NSTextAlignment.center
        view.addSubview(textLabel)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
