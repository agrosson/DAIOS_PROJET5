//
//  ViewController.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 22/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: IBOutlets
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
    // MARK: Properties
    /// Variable to track image picked by UIPicker
    var  photoToDisplay = UIImageView()
    /// Variable to track add button chosen
    var  buttonToTrack = UIButton()
    /// Variable to check if no image is missing on central view when swipe
    var isImageMissingOnCentralView = true
    /// Variable that defines height of current screen
    private let screenHeight = UIScreen.main.bounds.height
    /// Variable that defines width of current screen
    private let screenWidth = UIScreen.main.bounds.width
    // MARK: IBActions
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
    // MARK: Methods
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
    }
    /**
     Function that adds pickerView for bottomLeftImageView
     - Parameter sender: the add button that is pressed
     */
    @IBAction func buttonBottomLeft(_ sender: UIButton) {
        photoToDisplay = bottomLeftImageView
        buttonToTrack = buttonBottomLeft
        addPicker()
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
        buttonTopLong.alpha = alphaCloseToNil
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
        showButtons()
    }
    /**
     Function that creates a imagePicker and UIAlertController
     */
    func addPicker() {
        // Create a UIImagePickerController
        let imagePickerController = UIImagePickerController()
        // Delegate to the viewController
        imagePickerController.delegate = self
        // Create a UIAlertController
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        //  Action for Camera
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                // Create picker with source . Camera
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true,completion: nil)
            }
            else {
                let actionSheet = UIAlertController(title: "Camera not available", message: "Click on Cancel", preferredStyle: .alert)
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
            let actionSheet = UIAlertController(title: "Photo is deleted", message: "Click on Cancel", preferredStyle: .alert)
            self.buttonToTrack.alpha = 1
            self.photoToDisplay.image = nil
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion : nil)
        }))
        // Action for Cancel
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion : nil)
    }
    /**
     Function that tells the delegate that the user picked a still image or movie and set the image picked as the photo to display on image view choosen.
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photoToDisplay.image = image
        buttonToTrack.alpha = alphaCloseToNil
        // What to do when operation is done
        picker.dismiss(animated: true, completion: nil)
    }
    /**
     Function that tells the delegate that the user cancelled the pick operation.
     */
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
            checkIfCentralViewCompletedWithImages()
            if !isImageMissingOnCentralView {
                moveCentralViewLeft()
            } else {
                let actionSheet = UIAlertController(title: "Sharing is not possible", message: "Add some photos before sharing", preferredStyle: .alert)
                actionSheet.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
                self.present(actionSheet, animated: true, completion : nil)
            }
        }
    }
    
    /** Swipe Action Up
    */
    @IBAction func swipeUpAction(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait {
            checkIfCentralViewCompletedWithImages()
            if !isImageMissingOnCentralView{
                moveCentralViewUp()
            } else {
                let actionSheet = UIAlertController(title: "Sharing is not possible", message: "Add some photos before sharing", preferredStyle: .alert)
                actionSheet.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
                self.present(actionSheet, animated: true, completion : nil)
            }
        }
    }
    // Function to check if central view is completed with images
    
    private func checkIfCentralViewCompletedWithImages(){
        switch centralView.centralViewDisplay {
        case .rectangleBotton:
            if topLeftImageView.image != nil && topRightImageView.image != nil && longBottomImageView.image != nil {
                isImageMissingOnCentralView = false
            } else {
                isImageMissingOnCentralView = true
            }
        case .rectangleTop:
            if bottomLeftImageView.image != nil && bottomRightImageView.image != nil && longTopImageView.image != nil {
                isImageMissingOnCentralView = false
            } else {
                isImageMissingOnCentralView = true
            }
        case .square:
            if bottomLeftImageView.image != nil && bottomRightImageView.image != nil && topLeftImageView.image != nil
                && topRightImageView.image != nil {
                isImageMissingOnCentralView = false
            } else {
                isImageMissingOnCentralView = true
            }
        }
    }
    
    
    /**
     Function that executes actions when user swipe up
     - Notes:
     1. Hide buttons that add photos on imageView
     2. Create a animation and move centralView upward
     3. Display a UIActivityViewController
     */
    private func moveCentralViewUp(){
        self.combinedShapedHidden()
        rotate360()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let moveUp = CGAffineTransform(translationX: 0, y: -2*self.screenHeight)
            UIView.animate(withDuration: 0.8, animations: {
                self.centralView.transform = moveUp
            }) { (true) in
                self.showActivityController()
            }
        })

       // showButtons()

    }
    /**
     Function that executes actions when user swipe left
     - Notes:
     1. Hide buttons that add photos on imageView
     2. Create a animation and move centralView left
     3. Display a UIActivityViewController
     */
    private func moveCentralViewLeft(){
        self.combinedShapedHidden()
        rotate360()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            let go = CGAffineTransform(translationX: -2*self.screenWidth, y: 0)
            UIView.animate(withDuration: 1, animations: {
                self.centralView.transform = go
            }) { (true) in
                self.showActivityController()
            }
        })
    }
    /**
     Function that display a UIActivityViewController and share centralView.renderedImage! as an image
     - Notes:
     1. Share centralView.renderedImage! as an image
     2. Move centralView back to the center when UIActivityViewController in completed
     3. Launch showButtons
     */
    private func showActivityController() {
        let activityController = UIActivityViewController(activityItems: [centralView.renderedImage!], applicationActivities: nil)
        present(activityController, animated: true, completion:{
        self.centralView.transform = .identity
        self.showButtons()
        })
    }
    /**
     Function that creates a 360° rotation animation on centralView
     */
    private func rotate360() {
        let move360 = CABasicAnimation(keyPath: "transform.rotation")
        move360.fromValue = 0
        move360.toValue = 2*CGFloat.pi
        move360.duration = 1
        self.centralView.layer.add(move360, forKey: nil)
    }
    /**
     Override viewWillTransition to modify outlet depending on device orientation
     */
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = textSwipeLeft
        } else {
            swipeLabel.text = textSwipeUp
        }
    }
    /**
     Function that launches the App and makes initial layout
     */
    private func launchApp(){
        centralView.centralViewDisplay = .rectangleBotton
        showButtons()
    }
    /**
     Function that fades out combinedShaped (buttons to add pictures) but buttons still active
     */
    private func combinedShapedAlphaNil() {
        buttonTopRight.alpha = alphaCloseToNil
        buttonTopLeft.alpha = alphaCloseToNil
        buttonTopLong.alpha = alphaCloseToNil
        buttonBottomLeft.alpha = alphaCloseToNil
        buttonBottomLong.alpha = alphaCloseToNil
        buttonBottomRight.alpha = alphaCloseToNil
    }
    /**
     Function that hiddes combinedShaped (buttons to add pictures):  buttons not active
     */
    private func combinedShapedHidden(){
        buttonTopRight.isHidden = true
        buttonTopLeft.isHidden = true
        buttonTopLong.isHidden = true
        buttonBottomLeft.isHidden = true
        buttonBottomLong.isHidden = true
        buttonBottomRight.isHidden = true
    }
}

