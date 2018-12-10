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
    private func setDisplay(_ optionDisplay: OptionDisplay) {
        switch optionDisplay {
        case .rectangleBotton:
            imageLong.isHidden = true
            imageLongBotton.isHidden = false
            imageTopLeft.isHidden = false
            imageTopRight.isHidden = false
            imageBottonRight.isHidden = true
            imageBottonLeft.isHidden = true
            print("rectangle bottom")
        case .rectangleTop:
            imageLong.isHidden = false
            imageLongBotton.isHidden = true
            imageTopLeft.isHidden = true
            imageTopRight.isHidden = true
            imageBottonRight.isHidden = false
            imageBottonLeft.isHidden = false
             print("rectangle top")
        case.square:
            imageTopLeft.isHidden = false
            imageTopRight.isHidden = false
            imageBottonRight.isHidden = false
            imageBottonLeft.isHidden = false
            imageLong.isHidden = true
            imageLongBotton.isHidden = true
             print("square")
        }
    }
}
