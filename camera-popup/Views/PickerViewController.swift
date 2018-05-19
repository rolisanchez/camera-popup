//
//  PickerViewController.swift
//  camera-popup
//
//  Created by Victor Rolando Sanchez Jara on 19/5/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation
import UIKit

class PickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageTake: UIImageView!
    var imagePicker: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isHidden = true
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func savePhoto(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(imageTake.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    //MARK: - Add image to Library
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    //MARK: - Image capture done here
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageTake.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        saveButton.isHidden = false
    }
}
