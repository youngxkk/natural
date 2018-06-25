//
//  Page1.swift
//  Natural
//
//  Created by youngxkk on 2018/6/23.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import UIKit
import AVFoundation


class Page1: UIViewController {
    
    //播放按钮
    @IBOutlet weak var playBtn: UIButton!
    
    
    //下面与播放器相关
    var playerItem:AVPlayerItem?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //初始化播放器
        let soundFile = Bundle.main.path(forResource: "spring_rain", ofType: "mp3")
        let url = URL(fileURLWithPath: soundFile!)
        playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem!)
        
        
        //下面是这个界面的背景图
        let img = UIImage(named: "pic_beach")
        let imgView = UIImageView(image: img)
        self.view.addSubview(imgView)
        view.backgroundColor = UIColor.cyan
        
        //下面是这个界面的文本相关 
//        let textLabel = PublicLabel.mainLabel(<#T##PublicLabel#>)
//        self.view.addSubview(textLabel)
        
        //下面是这个界面的按钮相关
        let playBtn = UIButton()
        playBtn.frame = CGRect(x: 112, y: 360, width: 150, height: 50)
        playBtn.layer.cornerRadius = 8
        playBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        playBtn.titleLabel?.font = UIFont.systemFont(ofSize:30)
        playBtn.setTitle("Play", for: .normal)
        playBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
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

    
    //页面显示时添加歌曲播放结束通知监听
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(finishedPlaying),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    
    //页面消失时取消歌曲播放结束通知监听
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    //歌曲播放完毕
    @objc func finishedPlaying(myNotification:NSNotification) {
        print("播放完毕!")
        let stopedPlayerItem: AVPlayerItem = myNotification.object as! AVPlayerItem
        stopedPlayerItem.seek(to: kCMTimeZero)
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
