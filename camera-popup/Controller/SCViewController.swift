//
//  SwiftyCamViewController.swift
//  camera-popup
//
//  Created by Victor Rolando Sanchez Jara on 19/5/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation
import UIKit
import Photos

class SCViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {
    
    @IBOutlet weak var captureButton: SwiftyRecordButton!
    @IBOutlet weak var flipCameraButton: UIButton!
    @IBOutlet weak var flashButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Set some constraints to view the camera 
        
        cameraDelegate = self
        maximumVideoDuration = 10.0
        shouldUseDeviceOrientation = true
        allowAutoRotate = true
        audioEnabled = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureButton.delegate = self
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        
        print("took photo")
        UIImageWriteToSavedPhotosAlbum(photo, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
}
