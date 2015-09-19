//
//  ViewController.swift
//  securesign
//
//  Created by Zhichun Li on 9/19/15.
//  Copyright (c) 2015 ajsz. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    private var imageController = ImageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      let cameraButton = UIButton(type: .Custom)
      cameraButton.frame = CGRect(x: (3*self.view.frame.width)/4, y: (5*self.view.frame.height)/8, width:50 , height: 50)
      cameraButton.setImage(UIImage(named: "camera"), forState: .Normal)
      cameraButton.addTarget(self, action: "showCamera:", forControlEvents: .TouchUpInside)
      self.view.addSubview(cameraButton)
      imageController.delegate = self
      imageController.sourceType = .Camera
      imageController.mediaTypes = [kUTTypeImage as String]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showCamera(sender: AnyObject) {
        self.presentViewController(imageController, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      NSLog("hi")
      self.dismissViewControllerAnimated(true, completion: nil)
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}

