//
//  ImageController.swift
//  securesign
//
//  Created by Zhichun Li on 9/19/15.
//  Copyright (c) 2015 ajsz. All rights reserved.
//

import UIKit

class ImageController: UIImagePickerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var signatureView=UIView(frame: CGRectMake((1.2 * self.view.frame.width)/2, (7*self.view.frame.height)/8, 100, 50))
        
        self.view.addSubview(signatureView)
        // Do any additional setup after loading the view.
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
