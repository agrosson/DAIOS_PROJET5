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
    @IBOutlet weak var selectedView2and1: UIView!
    @IBOutlet weak var selectedView2and2: UIView!
    @IBOutlet weak var selectedViex1and2: UIView!
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
    /**
     Function that modifies layout of centraView with rectangle view on top
     - Parameter sender: the button that is pressed
     */
    @IBAction func topRectangleButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .rectangleTop
        showButtons()
    }
    /**
     Function that modifies layout of centraView with 4 squares
     - Parameter sender: the button that is pressed
     */
    @IBAction func squareButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .square
        showButtons()
    }
    /**
     Function that modifies layout of centraView with rectangle view on bottom
     - Parameter sender: the button that is pressed
     */
    @IBAction func bottomRectangleButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .rectangleBotton
        showButtons()
    }
    /**
     Function that modifies layout of centraView: buttons to add photos on centralView are hidden or not
     - Switch on centralView.centralViewDisplay
     */
    private func showButtons() {
        combinedShapedAlphaNil()
        combinedShapedHidden()
        switch self.centralView.centralViewDisplay {
        case .rectangleBotton:
            showButtonsRectangleBottomCase()
        case .rectangleTop:
            showButtonsRectangleTopCase()
        case .square:
            showButtonsSquareCase()
        }
    }
    /**
     Function that hides or shows buttons (to add photos on centralView) for RectangleBotton case
     */
    private func showButtonsRectangleBottomCase(){
        selectedView2and1.isHidden = false
        selectedView2and2.isHidden = true
        selectedViex1and2.isHidden = true
        buttonTopLeft.isHidden = false
        buttonBottomLong.isHidden = false
        buttonTopRight.isHidden = false
        if topLeftImageView.image == nil {buttonTopLeft.alpha = 1}
        if topRightImageView.image == nil {buttonTopRight.alpha = 1}
        if longBottomImageView.image == nil {buttonBottomLong.alpha = 1}
    }
    /**
     Function that hides or shows buttons (to add photos on centralView) for RectangleTop case
     */
    private func showButtonsRectangleTopCase(){
        selectedView2and1.isHidden = true
        selectedView2and2.isHidden = true
        selectedViex1and2.isHidden = false
        buttonTopLong.isHidden = false
        buttonBottomLeft.isHidden = false
        buttonBottomRight.isHidden = false
        if bottomLeftImageView.image == nil {buttonBottomLeft.alpha = 1}
        if bottomRightImageView.image == nil {buttonBottomRight.alpha = 1}
        if longTopImageView.image == nil {buttonTopLong.alpha = 1}
    }
    /**
     Function that hides or shows buttons (to add photos on centralView) for Square case
     */
    private func showButtonsSquareCase(){
        selectedView2and1.isHidden = true
        selectedView2and2.isHidden = false
        selectedViex1and2.isHidden = true
        buttonTopLeft.isHidden = false
        buttonTopRight.isHidden = false
        buttonBottomLeft.isHidden = false
        buttonBottomRight.isHidden = false
        if bottomLeftImageView.image == nil {buttonBottomLeft.alpha = 1}
        if bottomRightImageView.image == nil {buttonBottomRight.alpha = 1}
        if topLeftImageView.image == nil {buttonTopLeft.alpha = 1}
        if topRightImageView.image == nil {buttonTopRight.alpha = 1}
    }
    /// Variable to track image picked by UIPicker
    var  photoToDisplay = UIImageView()
     /// Variable to track add button chosen
    var  buttonToTrack = UIButton()
     /// Variable that defines height of current screen
    private let screenHeight = UIScreen.main.bounds.height
    /// Variable that defines width of current screen
    private let screenWidth = UIScreen.main.bounds.width
    // List of button actions to select image from library
    /**
     Function that adds pickerView for topLeftImageView
    - Parameter sender: the add button that is pressed
    */
    @IBAction func buttonTopLeft(_ sender: UIButton) {
        photoToDisplay = topLeftImageView
        buttonToTrack = buttonTopLeft
        addPicker()
        showButtons()
    }
    /**
     Function that adds pickerView for topRightImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonTopRight(_ sender: UIButton) {
        photoToDisplay = topRightImageView
        buttonToTrack = buttonTopRight
        addPicker()
        showButtons()
        print("topright")
    }
    /**
     Function that adds pickerView for bottomLeftImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonBottomLeft(_ sender: UIButton) {
        photoToDisplay = bottomLeftImageView
        buttonToTrack = buttonBottomLeft
        addPicker()
        print("bottomLeft")
        showButtons()
    }
    /**
     Function that adds pickerView for bottomRightImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonBottomRight(_ sender: UIButton) {
        photoToDisplay = bottomRightImageView
        buttonToTrack = buttonBottomRight
        addPicker()
        print("bottomRight")
        showButtons()
    }
    /**
     Function that adds pickerView for longTopImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonTopLong(_ sender: UIButton) {
        photoToDisplay = longTopImageView
        buttonToTrack = buttonTopLong
        addPicker()
        print("longtop")
        buttonTopLong.alpha = 0.015
        showButtons()
    }
    /**
     Function that adds pickerView for longBottomImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonBottomLong(_ sender: UIButton) {
        photoToDisplay = longBottomImageView
        buttonToTrack = buttonBottomLong
        addPicker()
        print(("longBottom"))
        showButtons()
    }
    
    func addPicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        //  Action for Camera
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
        //  Action for Photo Library
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
        // Action for Cancel
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion : nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoToDisplay.image = image
        buttonToTrack.alpha = 0.015
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
    /// Swipe Action Left
    @IBAction func swipeLeftAction(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            print("go to left")
            moveCentralViewLeft()
        }
    }
    
    /** Swipe Action Up
    
    */
    @IBAction func swipeUpAction(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait {
            print("go to up")
            moveCentralViewUp()
        }
    }
    
    private func moveCentralViewUp(){
       self.combinedShapedHidden()
        let go = CGAffineTransform(translationX: 0, y: -2*screenHeight)
        UIView.animate(withDuration: 1, animations: {
            self.centralView.transform = go
        }) { (true) in
            self.showActivityController()
        }
    }
    
    private func moveCentralViewLeft(){
       self.combinedShapedHidden()
        let go = CGAffineTransform(translationX: -2*screenWidth, y: 0)
        UIView.animate(withDuration: 1, animations: {
            self.centralView.transform = go
        }) { (true) in
            self.showActivityController()
        }
    }
    
    private func showActivityController() {
        let activityController = UIActivityViewController(activityItems: [centralView.renderedImage!], applicationActivities: nil)
        present(activityController, animated: true, completion:{
        self.centralView.transform = .identity
        self.showButtons()
        })
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
        showButtons()
    }
    
    private func combinedShapedAlphaNil() {
        buttonTopRight.alpha = 0.015
        buttonTopLeft.alpha = 0.015
        buttonTopLong.alpha = 0.015
        buttonBottomLeft.alpha = 0.015
        buttonBottomLong.alpha = 0.015
        buttonBottomRight.alpha = 0.015
    }
    
    private func combinedShapedHidden(){
        buttonTopRight.isHidden = true
        buttonTopLeft.isHidden = true
        buttonTopLong.isHidden = true
        buttonBottomLeft.isHidden = true
        buttonBottomLong.isHidden = true
        buttonBottomRight.isHidden = true
    }
}

