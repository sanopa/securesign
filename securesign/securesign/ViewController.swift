//
//  ViewController.swift
//  securesign
//
//  Created by Zhichun Li on 9/19/15.
//  Copyright (c) 2015 ajsz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    private var imageController = ImageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cameraButton = UIButton(frame: CGRect(x: (3*self.view.frame.width)/4, y: (5*self.view.frame.height)/8, width:50 , height: 50))
        cameraButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cameraButton.setTitle("hi", forState: UIControlState.Normal)
        cameraButton.addTarget(self, action: "showCamera:", forControlEvents: .TouchUpInside)
        self.view.addSubview(cameraButton)
        imageController.delegate = self
        imageController.sourceType = .Camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showCamera(sender: AnyObject) {
        self.presentViewController(imageController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        NSLog("hi")
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}

