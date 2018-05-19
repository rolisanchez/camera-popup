//
//  ViewController.swift
//  camera-popup
//
//  Created by Victor Rolando Sanchez Jara on 18/5/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit
import PopupDialog

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pressedNormalPopup(_ sender: UIButton) {
        showNormalDialog()
    }
    
    @IBAction func pressedNextLevelCam(_ sender: UIButton) {
        showNLCameraDialog()
    }
    
    @IBAction func pressedSwiftyCam(_ sender: UIButton) {
        showSCCameraDialog()
    }
    
    @IBAction func pressesImagePicker(_ sender: UIButton) {
        showPickerDialog()
    }
    
    
    func showNormalDialog(animated: Bool = true) {
        
        // Prepare the popup
        let title = "THIS IS A DIALOG"
        let message = "Bacon ipsum dolor amet short ribs shankle turducken cow bresaola. Turkey jerky buffalo, ball tip ham hock ground round drumstick venison meatloaf bacon swine. Hamburger pork brisket chuck turkey spare ribs kielbasa pastrami porchetta alcatra boudin. Rump cupim brisket ground round hamburger porchetta. Beef ribs meatball hamburger picanha alcatra, pork belly shoulder. Pancetta fatback short ribs landjaeger. Turkey cupim sausage burgdoggen tongue ground round chicken meatloaf, doner beef turducken."
        
        // Create the dialog
        let popup = PopupDialog(title: title,
                                message: message,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                gestureDismissal: false, //false dismissal
                                hideStatusBar: true) {
                                    print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancel") {
            print("You pressed cancel")
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "Ok") {
            print("You pressed ok")
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: animated, completion: nil)
    }
    
    func showNLCameraDialog(animated: Bool = true) {
        
        // Create a camera view controller
        
        let cameraVC = CameraViewController(nibName: "CameraViewController", bundle: nil)
        
        
        // Create the dialog
        let popup = PopupDialog(viewController: cameraVC, buttonAlignment: .horizontal, transitionStyle: .bounceDown, gestureDismissal: true)
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancel", height: 60) {
            print("You pressed cancel")
        }
        buttonOne.layer.zPosition = 1
        
        // Add buttons to dialog
        popup.addButtons([buttonOne])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
        
    }
    
    func showSCCameraDialog(animated: Bool = true) {
        
        // Create a camera view controller
        
        let cameraVC = SCViewController(nibName: "SCViewController", bundle: nil)
        
        
        // Create the dialog
        let popup = PopupDialog(viewController: cameraVC, buttonAlignment: .horizontal, transitionStyle: .bounceDown, gestureDismissal: true)
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancel", height: 60) {
            print("You pressed cancel")
        }
        buttonOne.layer.zPosition = 1
        
        // Add buttons to dialog
        popup.addButtons([buttonOne])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
        
    }
    func showPickerDialog(animated: Bool = true) {
        
        // Create a camera view controller
        
        let cameraVC = PickerViewController(nibName: "PickerViewController", bundle: nil)
        
        
        // Create the dialog
        let popup = PopupDialog(viewController: cameraVC, buttonAlignment: .horizontal, transitionStyle: .bounceDown, gestureDismissal: true)
        
        // Create first button
        let buttonOne = CancelButton(title: "Cancel", height: 60) {
            print("You pressed cancel")
        }
        buttonOne.layer.zPosition = 1
        
        // Add buttons to dialog
        popup.addButtons([buttonOne])
        
        // Present dialog
        present(popup, animated: animated, completion: nil)
        
    }
    
    
}

