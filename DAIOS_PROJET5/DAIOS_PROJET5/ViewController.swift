//
//  ViewController.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 22/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // list of imageViews outlets to display photos
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    @IBOutlet weak var longTopImageView: UIImageView!
    @IBOutlet weak var longBottomImageView: UIImageView!
    
   // list of imageViews outlets to choose layout
    @IBOutlet weak var selectedView2_1: UIView!
    @IBOutlet weak var selectedView2_2: UIView!
    @IBOutlet weak var selectedViex1_2: UIView!
    
    // Global views and labels
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var centralView: CentralView!
    @IBOutlet weak var swipeStack: UIStackView!
    @IBOutlet weak var labelInstagrid: UILabel!
   
    // outlet buttons to add images
    @IBOutlet weak var buttonTopLeft: UIButton!
    @IBOutlet weak var buttonTopRight: UIButton!
    @IBOutlet weak var buttonBottomLeft: UIButton!
    @IBOutlet weak var buttonBottomRight: UIButton!
    @IBOutlet weak var buttonTopLong: UIButton!
    @IBOutlet weak var buttonBottomLong: UIButton!
    
    // list of button actions to choose layout
    @IBAction func topRectangleButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .rectangleTop
        selectedView2_1.isHidden = true
        selectedView2_2.isHidden = true
        selectedViex1_2.isHidden = false
        buttonTopLong.isHidden = false
        buttonBottomLeft.isHidden = false
        buttonBottomRight.isHidden = false
        buttonTopLeft.isHidden = true
        buttonTopRight.isHidden = true
        buttonBottomLong.isHidden = true
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .square
        selectedView2_1.isHidden = true
        selectedView2_2.isHidden = false
        selectedViex1_2.isHidden = true
        buttonTopLong.isHidden = true
        buttonBottomLeft.isHidden = false
        buttonBottomRight.isHidden = false
        buttonTopLeft.isHidden = false
        buttonTopRight.isHidden = false
        buttonBottomLong.isHidden = true
    }
    
    @IBAction func bottomRectangleButton(_ sender: UIButton) {centralView.centralViewDisplay = .rectangleBotton
        selectedView2_1.isHidden = false
        selectedView2_2.isHidden = true
        selectedViex1_2.isHidden = true
        buttonTopLong.isHidden = true
        buttonBottomLeft.isHidden = true
        buttonBottomRight.isHidden = true
        buttonTopLeft.isHidden = false
        buttonTopRight.isHidden = false
        buttonBottomLong.isHidden = false
        
    }
   
    // Variable to track image get from UIPicker
    
    var  photoToDisplay = UIImageView()
    var  buttonToTrack = UIButton()
    
    // List of button actions to select image from library
    @IBAction func buttonTopLeft(_ sender: UIButton) {
        photoToDisplay = topLeftImageView
        buttonToTrack = buttonTopLeft
        addPicker()
        buttonTopLeft.alpha = 0.015
        print("topleft")
    }
    @IBAction func buttonTopRight(_ sender: UIButton) {
        photoToDisplay = topRightImageView
        buttonToTrack = buttonTopRight
        addPicker()
        buttonTopRight.alpha = 0.015
        print("topright")
    }
    
    @IBAction func buttonBottomLeft(_ sender: UIButton) {
        photoToDisplay = bottomLeftImageView
        buttonToTrack = buttonBottomLeft
        addPicker()
        print("bottomLeft")
        buttonBottomLeft.alpha = 0.015
    }
    
    @IBAction func buttonBottomRight(_ sender: UIButton) {
        photoToDisplay = bottomRightImageView
        buttonToTrack = buttonBottomRight
        addPicker()
        print("bottomRight")
        buttonBottomRight.alpha = 0.015
    }
  
    @IBAction func buttonTopLong(_ sender: UIButton) {
        photoToDisplay = longTopImageView
        buttonToTrack = buttonTopLong
        addPicker()
        print("longtop")
        buttonTopLong.alpha = 0.015
    }
    @IBAction func buttonBottomLong(_ sender: UIButton) {
        photoToDisplay = longBottomImageView
        buttonToTrack = buttonBottomLong
        addPicker()
        print(("longBottom"))
        buttonBottomLong.alpha = 0.015
       
    }
   
    
    func addPicker(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        // 3. Create a Alert to display Action
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        // 3.1. Action for Camera
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                // Create picker with source . Camera
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true,completion: nil)
            }
            else {
                let actionSheet = UIAlertController(title: "Camera non disponible", message: "Appuyer sur Cancel", preferredStyle: .alert)
                actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(actionSheet, animated: true, completion : nil)
            }
            
            
        }))
        //  Action for Library
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true,completion: nil)
        }))
        // Action for Delete
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (action: UIAlertAction) in
            let actionSheet = UIAlertController(title: "L'image est supprimée", message: "Appuyer sur Cancel", preferredStyle: .alert)
            self.buttonToTrack.alpha = 1
            self.photoToDisplay.image = nil
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion : nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion : { () -> () in
            if  self.photoToDisplay.image == nil {self.buttonToTrack.alpha = CGFloat(1)}
        })
    
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoToDisplay.image = image
        buttonToTrack.alpha = 0.015
        if photoToDisplay.image == nil {buttonToTrack.alpha = CGFloat(1)}
        // What to do when operation is done
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // What to do when operation is done
        picker.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       launchApp()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
        } else {
            swipeLabel.text = "Swipe up to share"
            
        }
    }
    /**
     Function that launches the App and makes initial layout
     
     # The sequence is the following #
     The sequence is the following
     
     */
    private func launchApp(){

        centralView.centralViewDisplay = .rectangleBotton
        buttonTopLong.isHidden = true
        buttonBottomLeft.isHidden = true
        buttonBottomRight.isHidden = true
   
    }
    
    
}

