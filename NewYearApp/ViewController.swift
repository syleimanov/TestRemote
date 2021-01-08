//
//  ViewController.swift
//  NewYearApp
//
//  Created by Vladimir Syleimanov on 25.12.2020.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "NYVideo", ofType: "mov")!)
        let player = AVPlayer(url: path)
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self,
                selector: #selector(ViewController.videoDidPlayToAnd(_:)),
                name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"),
                object: player.currentItem)
    }
    @objc func videoDidPlayToAnd(_ notification: Notification) {
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        player.seek(to: CMTime.zero)
    }
}

