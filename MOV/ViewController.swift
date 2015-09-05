//
//  ViewController.swift
//  MOV
//
//  Created by Allen Lai on 9/5/15.
//  Copyright (c) 2015 Allen Lai. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class ViewController: UIViewController {
    
    
   // var fileURL = NSURL(fileURLWithPath:NSBundle.mainBundle().pathForResource("dronefish", ofType:"mp4")!)
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
   // let fileURL = NSBundle.mainBundle().URLForResource("dronefish", withExtension: "mp4")
    //var randomVideoPlayer = MPMoviePlayerController(contentURL: randomVideo)
    var moviePlayer : MPMoviePlayerController!
    var globalPlayer : MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let transform = CGAffineTransformMakeScale;
        progressBar.transform = CGAffineTransformScale(progressBar.transform, 1.9, 50)
        
        let path = NSBundle.mainBundle().pathForResource("dronefish", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = self.moviePlayer {
            player.view.frame = CGRect(x: 0, y: 0, width: 550, height: self.view.frame.size.height-50)
            globalPlayer = player
            player.view.sizeToFit()
            player.scalingMode = MPMovieScalingMode.Fill
            player.controlStyle = MPMovieControlStyle.None
            player.movieSourceType = MPMovieSourceType.File
            player.play()
            self.view.addSubview(player.view)
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "watcher:", userInfo: player, repeats: false)
        }
        
        
        // First, get the location of the touch
        //let location = longPress.locationInView
        
        // Create an SKAction to move your sprite
        //let moveAction = SKAction.moveToX(location.x, duration:1.0)
        
        // Execute the action on your sprite
        //yourSprite.runAction(moveAction)
        
        
//        var randomVideoPlayer: MPMoviePlayerController = MPMoviePlayerController(contentURL: url)
//        randomVideoPlayer.prepareToPlay()
//        randomVideoPlayer.view.frame = CGRectMake(0,0,320,320)
//        
//        randomVideoPlayer.view.sizeToFit()
//        
//        randomVideoPlayer.controlStyle = MPMovieControlStyle.None
//        randomVideoPlayer.movieSourceType = MPMovieSourceType.File
//        randomVideoPlayer.repeatMode = MPMovieRepeatMode.One
//        
//        randomVideoPlayer.play()
//        self.view.addSubview(randomVideoPlayer.view)
        
    }
    
    var rewinding = false
    
    @IBAction func rewind(sender: AnyObject) {
        globalPlayer.pause()
            //rewinding = true
            //rewindLoop()
            globalPlayer.currentPlaybackTime = globalPlayer.currentPlaybackTime - 0.1;
            //globalPlayer.beginSeekingBackward();
    }
    
    
    /*func rewindLoop(){
        //while(rewinding == true)
        //{
            globalPlayer.currentPlaybackTime = globalPlayer.currentPlaybackTime - 0.1;
            //NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "rewindLoop", userInfo: nil, repeats: false)
        //}
    }*/
    
    @IBAction func touch_up_play(sender: AnyObject)
    {
        
        globalPlayer.pause()
        globalPlayer.currentPlaybackTime = globalPlayer.currentPlaybackTime + 0.1;
        //rewinding = false
        //globalPlayer.endSeeking()
        //globalPlayer.pause()
    }
    
    
    func watcher(timer:NSTimer){
        progressBar.progress = Float(timer.userInfo!.currentPlaybackTime/timer.userInfo!.duration)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "watcher:", userInfo: timer.userInfo!, repeats: false)
        //to update the value each 0.5 seconds
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

