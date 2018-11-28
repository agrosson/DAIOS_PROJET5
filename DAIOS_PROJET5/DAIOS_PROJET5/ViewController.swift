//
//  ViewController.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 22/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centralView: CentralView!
    @IBOutlet weak var swipeStack: UIStackView!
    @IBOutlet weak var labelInstagrid: UILabel!
   
    @IBAction func topRectangleButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .rectangleTop
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        centralView.centralViewDisplay = .square
    }
    
    @IBAction func bottomRectangleButton(_ sender: UIButton) {centralView.centralViewDisplay = .rectangleBotton
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       launchApp()
    }
    /**
     Function that launches the App and makes initial layout
     
     # The sequence is the following #
     The sequence is the following
     
     */
    private func launchApp(){

        centralView.centralViewDisplay = .square
   
    }
    
    
}

