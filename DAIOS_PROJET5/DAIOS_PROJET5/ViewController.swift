//
//  ViewController.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 22/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var topLeftImageView: UIImageView!
    
    @IBOutlet weak var topRightImageView: UIImageView!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    @IBOutlet weak var longTopImageView: UIImageView!
    
    
    @IBOutlet weak var longBottomImageView: UIImageView!
    
   
    @IBOutlet weak var selectedView2_1: UIView!
    
    @IBOutlet weak var selectedView2_2: UIView!
    
    @IBOutlet weak var selectedViex1_2: UIView!
    @IBOutlet weak var swipeLabel: UILabel!
    @IBOutlet weak var centralView: CentralView!
    @IBOutlet weak var swipeStack: UIStackView!
    @IBOutlet weak var labelInstagrid: UILabel!
   
    // outlet buttons
    @IBOutlet weak var buttonTopLeft: UIButton!
    @IBOutlet weak var buttonTopRight: UIButton!
    @IBOutlet weak var buttomBottomLeft: UIButton!
    @IBOutlet weak var buttomBottomRight: UIButton!
    @IBOutlet weak var buttomTopLong: UIButton!
    @IBOutlet weak var buttomBottomLong: UIButton!
    
    
    @IBAction func topRectangleButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .rectangleTop
        selectedView2_1.isHidden = true
        selectedView2_2.isHidden = true
        selectedViex1_2.isHidden = false
        buttomTopLong.isHidden = false
        buttomBottomLeft.isHidden = false
        buttomBottomRight.isHidden = false
        buttonTopLeft.isHidden = true
        buttonTopRight.isHidden = true
        buttomBottomLong.isHidden = true
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .square
        selectedView2_1.isHidden = true
        selectedView2_2.isHidden = false
        selectedViex1_2.isHidden = true
        buttomTopLong.isHidden = true
        buttomBottomLeft.isHidden = false
        buttomBottomRight.isHidden = false
        buttonTopLeft.isHidden = false
        buttonTopRight.isHidden = false
        buttomBottomLong.isHidden = true
    }
    
    @IBAction func bottomRectangleButton(_ sender: UIButton) {centralView.centralViewDisplay = .rectangleBotton
        selectedView2_1.isHidden = false
        selectedView2_2.isHidden = true
        selectedViex1_2.isHidden = true
        buttomTopLong.isHidden = true
        buttomBottomLeft.isHidden = true
        buttomBottomRight.isHidden = true
        buttonTopLeft.isHidden = false
        buttonTopRight.isHidden = false
        buttomBottomLong.isHidden = false
        
    }
   
    // Buttons add pictures
    
    var  photoToDisplay = UIImageView()
    
    
    @IBAction func buttonTopLeft(_ sender: UIButton) {
        photoToDisplay = topLeftImageView
        addPicker()
        buttonTopLeft.alpha = 0.015
        print("topleft")
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
        // 3.1. Action for Library
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true,completion: nil)
        }))
        // 3.1. Action for Cancel
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion : nil)
        print("topleft")
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoToDisplay.image = image
        // What to do when operation is done
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // What to do when operation is done
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonTopRight(_ sender: UIButton) {
        photoToDisplay = topRightImageView
        addPicker()
        buttonTopRight.alpha = 0.15
        print("topright")
    }
    
    
    @IBAction func buttonBottomLeft(_ sender: UIButton) {
        photoToDisplay = bottomLeftImageView
        addPicker()
        print("bottomLeft")
        buttomBottomLeft.alpha = 0.15
    }
    
    @IBAction func buttonBottomRight(_ sender: UIButton) {
        photoToDisplay = bottomRightImageView
        addPicker()
        print("bottomRight")
        buttomBottomRight.alpha = 0.15
    }
    
    
    @IBAction func buttonTopLong(_ sender: UIButton) {
        photoToDisplay = longTopImageView
        addPicker()
        print("longtop")
        buttomTopLong.alpha = 0.15
    }
    
    @IBAction func buttonBottomLong(_ sender: UIButton) {
        photoToDisplay = longBottomImageView
        addPicker()
        print(("longBottom"))
        buttomBottomLong.alpha = 0.15
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
        buttomTopLong.isHidden = true
        buttomBottomLeft.isHidden = true
        buttomBottomRight.isHidden = true
   
    }
    
    
}

