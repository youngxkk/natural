//
//  Page1.swift
//  Natural
//
//  Created by youngxkk on 2018/6/23.
//  Copyright © 2018 youngxkk. All rights reserved.
//

import UIKit
import AVFoundation


func playSound(audioName: String, isAlert: Bool , playFinish: (()->())?) {
    
    // 一. 获取 SystemSoundID
    //   参数1: 文件路径
    //   参数2: SystemSoundID, 指针
    guard let url = Bundle.main.url(forResource: "beach.mp3", withExtension: nil) else {
        print("没有找到音频路径")
        return
    }
    let urlCF = url as CFURL
    
    var systemSoundID: SystemSoundID = 0
    AudioServicesCreateSystemSoundID(urlCF, &systemSoundID)
    
    // 二. 播放器相关
    
    // 判断是否振动
    if isAlert {
        // 1. 带振动播放, 可以监听播放完成(模拟器不行)
        AudioServicesPlayAlertSoundWithCompletion(systemSoundID)
        {
            print("带振动播放完成")
            // 三. 释放资源
            AudioServicesDisposeSystemSoundID(systemSoundID)
            
            // 四. 执行回调
            if playFinish != nil { playFinish!()}
        }
    }else {
        // 2. 不带振动播放, 可以监听播放完成
        AudioServicesPlaySystemSoundWithCompletion(systemSoundID) {
            
            print("播放完成")
            // 三. 释放资源
            AudioServicesDisposeSystemSoundID(systemSoundID)
            
            // 四. 执行回调
            if playFinish != nil { playFinish!()}
        }
    }
}




class Page1: UIViewController {
    
    //下面与播放器相关
    var playerItem:AVPlayerItem?
    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //初始化播放器
        let url = URL(string: "beach.mp3")
        playerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem!)
        
        
        //下面是这个界面的背景图
        let img = UIImage(named: "pic_beach")
        let imgView = UIImageView(image: img)
        self.view.addSubview(imgView)
        
        view.backgroundColor = UIColor.cyan
        
        //下面是这个界面的文本相关
        let textLabel = UILabel(frame: CGRect(x: 0, y: 520, width: self.view.frame.width, height: 50))
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.textColor = UIColor.white
        textLabel.alpha = 0.5
        textLabel.text = "Beach"
        view.addSubview(textLabel)
        
        //下面是这个界面的按钮相关
        let playBtn = UIButton()
        playBtn.frame = CGRect(x: 100, y: 200, width: 100, height: 40)
        playBtn.setTitle("play", for: .normal)
        playBtn.backgroundColor = UIColor.black
        playBtn.addTarget(self, action: #selector(tappedPlay(_:)), for: .touchUpInside)
        self.view.addSubview(playBtn)
        
        
        // Do any additional setup after loading the view.
    }

    @objc func tappedPlay(_ playBtn: UIButton){
        print("play233")
        //根据rate属性判断当天是否在播放
        if player?.rate == 0 {
            player!.play()
            playBtn.setTitle("暂停", for: .normal)
        } else {
            player!.pause()
            playBtn.setTitle("播放", for: .normal)
        }
//        player!.play()
//        playSound(audioName: "beach.mp3", isAlert: true, playFinish: nil)
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
