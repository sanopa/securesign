//
//  ViewController.swift
//  securesign
//
//  Created by Zhichun Li on 9/19/15.
//  Copyright (c) 2015 ajsz. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLUploaderDelegate {

    private var imageController = ImageViewController()
    private let cloudinary = CLCloudinary()

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

      cloudinary.config().setValue("dbsi55q8p", forKey: "cloud_name")
      cloudinary.config().setValue("952365329324767", forKey: "api_key")
      cloudinary.config().setValue("8vqdTCimEFHGxf_wN0X_wVzFxow", forKey: "api_secret")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showCamera(sender: AnyObject) {
        self.presentViewController(imageController, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      let cropRect = picker.cameraOverlayView?.frame
      self.dismissViewControllerAnimated(true) { () -> Void in
        let imageData = info[UIImagePickerControllerOriginalImage]
        let imageRef = CGImageCreateWithImageInRect(imageData?.CGImage, cropRect!)
        let croppedImage = UIImage(CGImage: imageRef!)
        let imageRequestData = UIImagePNGRepresentation(croppedImage)

        let uploader = CLUploader(self.cloudinary, delegate: self)
        let _ = uploader.upload(imageRequestData, options:[:])
      }
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

  func uploaderSuccess(result: [NSObject : AnyObject]!, context: AnyObject!) {
    let public_id = result["url"]
    NSLog("\(public_id)")
    //    let device_id = UIDevice.currentDevice().identifierForVendor?.UUIDString
    let serverAddress = "http://securisign-51650.onmodulus.net/api/predict/"

    let requestURL = NSURL(string: "\(serverAddress)?personID=sonya&imageURL=\(public_id!)")

    NSLog("\(requestURL)")
    let request = NSMutableURLRequest(URL: requestURL!)
    request.HTTPMethod = "GET"

    NSURLConnection.sendAsynchronousRequest(request,
      queue: NSOperationQueue()) { (urlResponse, responseData, error) -> Void in
        if responseData != nil {
          let response = NSString(data: responseData!, encoding: NSUTF8StringEncoding)?.integerValue
          NSLog("\(response)")
        } else {
          NSLog("Something went wrong: \(error)")
        }
    }
  }

  func uploaderError(result: String!, code: Int, context: AnyObject!) {
    NSLog("Upload error: \(result) \(code)")
  }
}

