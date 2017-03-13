//
//  SelectCharacterViewController.swift
//  Cartoon Your Body
//
//  Created by John Daratzikis on 16/11/15.
//  Copyright © 2015 Ioannis Daratzikis. All rights reserved.
//

import UIKit
import Foundation
import GoogleMobileAds

class SelectCharacterViewController: UIViewController {
    
  
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ScrollView.contentSize.width = 1250
        
        self.bannerView.adUnitID = "ca-app-pub-8038450560634417/4370733289"
        //"ca-app-pub-3940256099942544/2934735716"
        self.bannerView.rootViewController = self
        self.view.addSubview(bannerView)
        let request: GADRequest = GADRequest()
        request.testDevices = [""]
        self.bannerView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    @IBAction func RobotButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "robot"
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func CatButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "cat"
        presentViewController(vc, animated: true, completion: nil)
    }
   
    @IBAction func KoalaButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "koala"
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func MokeyButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "monkey"
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func DuckButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "duck"
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func OctapusButton(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        vc.character = "octapus"
        presentViewController(vc, animated: true, completion: nil)
    }
    
}

