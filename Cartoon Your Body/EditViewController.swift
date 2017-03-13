//
//  EditViewController.swift
//  Cartoon Your Body
//
//  Created by John Daratzikis on 16/11/15.
//  Copyright © 2015 Ioannis Daratzikis. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var topToolbar: UIToolbar!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    
    @IBOutlet weak var cameraButtonOutlet: UIBarButtonItem!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var shareButtonOutlet: UIBarButtonItem!
  
    
    var character: String!
    
    var cartoon:Cartoon!
    var cartoonedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.scrollView.delegate = self
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.0
        
        switch character{
            case "robot":
                characterImage.image = UIImage(named: "Robot Character Edit")
            case "cat":
                characterImage.image = UIImage(named: "Cat Character Edit")
            case "koala":
                characterImage.image = UIImage(named: "Koala Character Edit")
            case "monkey":
                characterImage.image = UIImage(named: "Monkey Character Edit")
            case "duck":
                characterImage.image = UIImage(named: "Duck Character Edit")
            case "octapus":
                characterImage.image = UIImage(named: "Octapus Character Edit")
            default:
                break
        }
        
        shareButtonOutlet.enabled = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Camera Button is enabled only when a device has a camera
        cameraButtonOutlet.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func shareButton(sender: UIBarButtonItem) {
        
        let objectToShare = [generateCartoonedImage()]
        let activityVC = UIActivityViewController(activityItems: objectToShare, applicationActivities: nil)
        
        save()
        
        self.presentViewController(activityVC, animated: true, completion: nil)
    }

    @IBAction func cameraButton(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(pickerController, animated: true, completion:nil)
    }
    
    @IBAction func albumButton(sender: UIBarButtonItem) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion:nil)

    }
    
    //Pick an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            self.userImage.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        shareButtonOutlet.enabled = true
        
    }
    
    //What happens when the image picker cancels
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Save Cartoon Image to apps album
    func save() {
        
        cartoonedImage = generateCartoonedImage()
        let cartoon = Cartoon(userImage: userImage.image!,characterImage:characterImage.image!,cartoonedImage: cartoonedImage)
        self.cartoon = cartoon
    }
    
    //Generates a cartoon image
    func generateCartoonedImage() -> UIImage {
        
        // Hide toolbar
        topToolbar.hidden = true
        bottomToolbar.hidden = true
        
        navigationController?.navigationBar.hidden = true
        navigationController?.toolbar.hidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let cartoonedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Show toolbar
        topToolbar.hidden = false
        bottomToolbar.hidden = false
        
        return cartoonedImage
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.userImage
    }

}

