//
//  Page2.swift
//  Natural
//
//  Created by youngxkk on 2018/6/23.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import UIKit
import AVFoundation

class Page2: UIViewController {
    //播放按钮
    @IBOutlet weak var playBtn: UIButton!
    
    
    //下面与播放器相关
    var playerItem:AVPlayerItem?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //初始化播放器
        let soundFile = Bundle.main.path(forResource: "forest", ofType: "mp3")
        let url = URL(fileURLWithPath: soundFile!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem!)
        
        
        let img = UIImage(named: "pic_summer_night")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        imgView.contentMode = UIViewContentMode.scaleAspectFill
        self.view.addSubview(imgView)
//        view.backgroundColor = UIColor.yellow
        
        let textLabel = UILabel(frame: CGRect(x: 0, y: 540, width: self.view.frame.width, height: 50))
        
        textLabel.text = "Summer night"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        textLabel.alpha = 0.5
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = NSTextAlignment.center
        view.addSubview(textLabel)
        
        //下面是这个界面的按钮相关
        let playBtn = UIButton()
        playBtn.frame.size = CGSize(width: 150, height: 50)
        playBtn.center.x = self.view.bounds.width / 2
        playBtn.center.y = self.view.bounds.height / 2
        playBtn.layer.cornerRadius = 1
        playBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        playBtn.titleLabel?.font = UIFont.systemFont(ofSize:20)
        playBtn.setTitle("Play", for: .normal)
        playBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        playBtn.addTarget(self, action: #selector(tappedPlay(_:)), for: .touchUpInside)
        self.view.addSubview(playBtn)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedPlay(_ sender: Any) {
        print("play233")
        //根据rate属性判断当时是否在播放
        
        if player!.rate == 0.0 {
            player!.play()
            //           playBtn.setTitle("pause", for: .normal)
        } else {
            player!.pause()
            //           playBtn.setTitle("Play", for: .normal)
        }
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
