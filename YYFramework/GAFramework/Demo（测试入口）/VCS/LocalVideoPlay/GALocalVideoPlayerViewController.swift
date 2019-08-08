//
//  GALocalVideoPlayerViewController.swift
//  YYFramework
//
//  Created by houjianan on 2019/7/29.
//  Copyright © 2019 houjianan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class GALocalVideoPlayerViewController: UIViewController {

    var player: AVPlayer!
    var _playerView: SuperPlayerView!
    var ql_player: PLPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        _initViews()
        _initSuperPlayerView()
        
//        _init_pl_PlayerView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
//        let path = Bundle.main.path(forResource: "testMP4.mp4", ofType: nil)
//        let vc = AVPlayerViewController()
//        vc.player = AVPlayer(url: URL(fileURLWithPath: path ?? ""))
//        self.present(vc, animated: true, completion: nil)
        
//        player.play()
    }
    
    func _init_pl_PlayerView() {
//        let path = Bundle.main.path(forResource: "testMP4.mp4", ofType: nil)
//        let path = Bundle.main.path(forResource: "SOP宣讲-业绩总监.avi", ofType: nil)
//        let path = Bundle.main.path(forResource: "http://pvfrpu5n5.bkt.clouddn.com/SOP%E5%AE%A3%E8%AE%B2-%E4%B8%9A%E7%BB%A9%E6%80%BB%E7%9B%91.avi", ofType: nil)
        let path = Bundle.main.path(forResource: "http://pvfrpu5n5.bkt.clouddn.com/04.mp4", ofType: nil)
        
        let url = URL(fileURLWithPath: path ?? "")
        self.ql_player = PLPlayer(liveWith: url, option: nil)
        self.ql_player.delegate = self
        self.view.addSubview(ql_player.playerView!)
        self.ql_player.play()
    }
    
    func _initSuperPlayerView() {
        _playerView = SuperPlayerView()
        // 设置父View
        _playerView.fatherView = self.view
        
        let playerModel = SuperPlayerModel()
        // 设置播放地址，直播、点播都可以
        // testMP4.mp4 testAvi.avi http://pvfrpu5n5.bkt.clouddn.com/SOP%E5%AE%A3%E8%AE%B2-%E4%B8%9A%E7%BB%A9%E6%80%BB%E7%9B%91.avi
        // http://pvfrpu5n5.bkt.clouddn.com/04.mp4
        let path = Bundle.main.path(forResource: "http://pvfrpu5n5.bkt.clouddn.com/04.mp4", ofType: nil)
//        let path = Bundle.main.path(forResource: "testAvi.avi", ofType: nil)
        playerModel.videoURL = path
        // 开始播放
        _playerView.play(with: playerModel)
    }
    
    func _initViews() {
        let path = Bundle.main.path(forResource: "testAvi.avi", ofType: nil)
        let url = URL(fileURLWithPath: path ?? "")
        //设置播放的项目
        let item = AVPlayerItem(url: url)
        //初始化player对象
        player = AVPlayer(playerItem: item)
        //设置播放页面
        let layer = AVPlayerLayer.init(player: player)
        //设置播放页面的大小
        layer.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        layer.backgroundColor = UIColor.lightGray.cgColor
        //设置播放窗口和当前视图之间的比例显示内容
        layer.videoGravity = .resizeAspect
        self.view.layer.addSublayer(layer)
        //添加播放视图到self.view
        //设置播放的默认音量值
        self.player.volume = 1.0
    }

}

extension GALocalVideoPlayerViewController: PLPlayerDelegate {
    
}

