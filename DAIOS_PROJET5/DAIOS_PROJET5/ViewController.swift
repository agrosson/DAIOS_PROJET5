//
//  ViewController.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 22/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .square
        selectedView2_1.isHidden = true
        selectedView2_2.isHidden = false
        selectedViex1_2.isHidden = true
    }
    
    @IBAction func bottomRectangleButton(_ sender: UIButton) {centralView.centralViewDisplay = .rectangleBotton
        selectedView2_1.isHidden = false
        selectedView2_2.isHidden = true
        selectedViex1_2.isHidden = true
        
    }
   
    // Buttons add pictures
    
    
    
    @IBAction func buttonTopLeft(_ sender: UIButton) {
        print("topleft")
    }
    
    @IBAction func buttonTopRight(_ sender: UIButton) {
        print("topright")
    }
    
    
    @IBAction func buttonBottomLeft(_ sender: UIButton) {
        print("bottomLeft")
    }
    
    @IBAction func buttonBottomRight(_ sender: UIButton) {
        print("bottomRight")
    }
    
    
    @IBAction func buttonTopLong(_ sender: UIButton) {
        print("longtop")
    }
    
    @IBAction func buttonBottomLong(_ sender: UIButton) {
        print(("longBottom"))
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
   
    }
    
    
}

