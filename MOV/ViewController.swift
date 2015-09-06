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
    
    
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
   // let fileURL = NSBundle.mainBundle().URLForResource("dronefish", withExtension: "mp4")
    //var randomVideoPlayer = MPMoviePlayerController(contentURL: randomVideo)
    var moviePlayer : MPMoviePlayerController!
    var globalPlayer : MPMoviePlayerController!
    
    var screenWidth = (UIScreen.mainScreen().bounds.width)
    var screenHeight = (UIScreen.mainScreen().bounds.height)
    
    var leftView = UIView()
    var centerView = UIView()
    var rightView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
    
    var centerTapSelector = UILongPressGestureRecognizer()
    
    override func viewDidAppear(animated: Bool) {
        
        //let transform = CGAffineTransformMakeScale;
        //progressBar.transform = CGAffineTransformScale(progressBar.transform, 1, 1)
        
        let path = NSBundle.mainBundle().pathForResource("dronefish", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        screenWidth = screenWidth - rewindButton.frame.size.width
        screenHeight = screenHeight - progressBar.frame.size.height
        
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = self.moviePlayer {
            player.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            globalPlayer = player
            player.view.sizeToFit()
            player.scalingMode = MPMovieScalingMode.Fill
            player.controlStyle = MPMovieControlStyle.None
            player.movieSourceType = MPMovieSourceType.File
            player.play()
            self.view.addSubview(player.view)
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "watcher:", userInfo: player, repeats: false)
        }
        
        
        leftView=UIView(frame: CGRectMake(0, 0, screenWidth/3, screenHeight))
        let leftTapSelector = UILongPressGestureRecognizer(target: self, action: "leftTap:")
        //leftTapSelector.minimumPressDuration = 1
        leftView.addGestureRecognizer(leftTapSelector)
        leftView.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        self.view.addSubview(leftView)
        
        centerView=UIView(frame: CGRectMake(screenWidth/3, 0, screenWidth/3, screenHeight))
        centerTapSelector = UILongPressGestureRecognizer(target: self, action: "centerTap:")
        centerTapSelector.minimumPressDuration = 0
        centerView.addGestureRecognizer(centerTapSelector)
        //let centerReleaseSelector = UITapGestureRecognizer(target: self, action: Selector("centerTap"))
        //centerView.addGestureRecognizer(centerTapSelector)
        self.view.addSubview(centerView)

        rightView=UIView(frame: CGRectMake(2*screenWidth/3, 0, screenWidth/3, screenHeight))
        let rightTapSelector = UILongPressGestureRecognizer(target: self, action: "rightTap:")
        //rightTapSelector.minimumPressDuration = 1
        rightView.addGestureRecognizer(rightTapSelector)
        rightView.backgroundColor=UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        self.view.addSubview(rightView)
    
        //centerTapSelector.delegate = self
        
        //let centerTapSelector = UIGestureRecognizer(self, action: Selector("centerTap:"), forControlEvents: UIControlEvents.TouchDown)
        
        
        
        //centerView.userInteractionEnabled = true
        
        


        
    }
    
    //var tracking = false!
    func leftTap(gestureRecognizer:UIGestureRecognizer) {
        if(gestureRecognizer.state != UIGestureRecognizerState.Ended)
        {
            
            /*let pos = gestureRecognizer.locationInView(leftView)
            let x = pos.x
            let y = pos.y
            print("(")
            print(String(stringInterpolationSegment: x) + ", ")
            print(String(stringInterpolationSegment: y) + ")")*/
            
        }
    }
    //var tracking = false!
    func centerTap(gestureRecognizer:UIGestureRecognizer) {
        if(gestureRecognizer.state != UIGestureRecognizerState.Ended)
        {
            let pos = gestureRecognizer.locationInView(centerView)
            let x = pos.x
            let y = pos.y
            print("(")
            print(String(stringInterpolationSegment: x) + ", ")
            print(String(stringInterpolationSegment: y) + ")")
            println()
            
            
            
        }
    }
    //var tracking = false!
    func rightTap(gestureRecognizer:UIGestureRecognizer) {
        if(gestureRecognizer.state != UIGestureRecognizerState.Ended)
        {
            /*let pos = gestureRecognizer.locationInView(rightView)
            let x = pos.x
            let y = pos.y
            print("(")
            print(String(stringInterpolationSegment: x) + ", ")
            print(String(stringInterpolationSegment: y) + ")")
            println()*/
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch : AnyObject in touches {
        var startPoint = touch.locationInView(self.view)
        
        let x = startPoint.x
        let y = startPoint.y
        print("(")
        print(String(stringInterpolationSegment: x) + ", ")
        print(String(stringInterpolationSegment: y) + ")")
        println()
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch : AnyObject in touches {
            var touchLocation = touch.locationInView(self.view)
            let x = touchLocation.x
            let y = touchLocation.y
            print("(")
            print(x)
            print(", ")
            print(y)
            print(")")
            println()
            
            if()
        }
    }
    
    //override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch : AnyObject in touches {
        var endPoint = touch.locationInView(self.view)
        let x = endPoint.x
        let y = endPoint.y
        print("(")
        print(x)
        print(", ")
        print(y)
            print(")")
            println()
        }
    }
    
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
    
    
    /*@IBAction func centerTap(sender: AnyObject)
    {
        
        globalPlayer.stop()
        //rewinding = false
        //globalPlayer.endSeeking()
        //globalPlayer.pause()
    }*/
    
    
    @IBAction func touch_up_play(sender: AnyObject)
    {
        
        globalPlayer.pause()
        globalPlayer.currentPlaybackTime = globalPlayer.currentPlaybackTime + 0.2;
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

