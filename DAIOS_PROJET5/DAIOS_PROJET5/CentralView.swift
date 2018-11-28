//
//  centralView.swift
//  DAIOS_PROJET5
//
//  Created by ALEXANDRE GROSSON on 26/11/2018.
//  Copyright © 2018 GROSSON. All rights reserved.
//

import UIKit

class CentralView: UIView {

    
    @IBOutlet private var imageTopRight: UIImageView!
    @IBOutlet private var imageTopLeft: UIImageView!
    @IBOutlet private var imageBottonRight: UIImageView!
    @IBOutlet private var imageBottonLeft: UIImageView!
    @IBOutlet private var imageLong: UIImageView!
    @IBOutlet private var imageLongBotton: UIImageView!
    @IBOutlet private var addSignTopLeft: UIImageView!
    @IBOutlet private var addSignTopRight: UIImageView!
    @IBOutlet private var addSignBottomLeft: UIImageView!
    @IBOutlet private var addSignBottomRight: UIImageView!
    @IBOutlet private var addSignTopLong: UIImageView!
    @IBOutlet private var addSignBottomLong: UIImageView!
    
    
    
    
    /// Enumeration that lists options to display the imageView of centralView
    enum OptionDisplay {
        case rectangleTop, rectangleBotton, square
    }
    
    /// Variable of type OptionDisplay used to set layout in regards with option choosen
    var centralViewDisplay: OptionDisplay = .rectangleBotton {
        didSet {
            setDisplay(centralViewDisplay)
        }
    }
    
    
    private func setDisplay(_ optionDisplay: OptionDisplay){

        switch optionDisplay {
        case .rectangleBotton:
            imageLong.isHidden = true
            addSignTopLong.isHidden = true
            imageLongBotton.isHidden = false
            addSignBottomLong.isHidden = false
            imageTopLeft.isHidden = false
            addSignTopLeft.isHidden = false
            imageTopRight.isHidden = false
            addSignTopRight.isHidden = false
            imageBottonRight.isHidden = true
            addSignBottomRight.isHidden = true
            imageBottonLeft.isHidden = true
            addSignBottomLeft.isHidden = true
            print("rectangle bottom")
        case .rectangleTop:
            imageLong.isHidden = false
            addSignTopLong.isHidden = false
            imageLongBotton.isHidden = true
            addSignBottomLong.isHidden = true
            imageTopLeft.isHidden = true
            addSignTopLeft.isHidden = true
            imageTopRight.isHidden = true
             addSignTopRight.isHidden = true
            imageBottonRight.isHidden = false
            addSignBottomRight.isHidden = false
            imageBottonLeft.isHidden = false
            addSignBottomLeft.isHidden = false
             print("rectangle top")
        case.square:
            
            imageTopLeft.isHidden = false
            addSignTopLeft.isHidden = false
            imageTopRight.isHidden = false
            addSignTopRight.isHidden = false
            imageBottonRight.isHidden = false
            addSignBottomRight.isHidden = false
            imageBottonLeft.isHidden = false
            addSignBottomLeft.isHidden = false
            imageLong.isHidden = true
            addSignTopLong.isHidden = true
            imageLongBotton.isHidden = true
            addSignBottomLong.isHidden = true
             print("square")
        }
    }
}
