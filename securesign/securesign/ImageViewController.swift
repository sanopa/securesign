//
//  ImageViewController.swift
//  securesign
//
//  Created by Zhichun Li on 9/19/15.
//  Copyright (c) 2015 ajsz. All rights reserved.
//

import UIKit

class ImageViewController: UIImagePickerController {
    private let signatureBoxXPadding = CGFloat(36)
    private let signatureBoxWidth = CGFloat(60)
    private let signatureBorderBorderWidth = CGFloat(1)

    override func viewDidLoad() {
      super.viewDidLoad()

      let signatureBorder = UIView(frame: CGRect(
        x: 2 * view.frame.width / 5,
        y: 3 * view.frame.height / 5,
        width: view.frame.width / 2,
        height: view.frame.height / 15
      ))
      signatureBorder.layer.borderWidth = signatureBorderBorderWidth
      signatureBorder.layer.borderColor = UIColor.grayColor().CGColor
      signatureBorder.layer.cornerRadius = signatureBorderBorderWidth

      self.cameraOverlayView = signatureBorder
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
