//
//  TicTacToeCell.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import Foundation
import UIKit

class TicTacToeCell: UICollectionViewCell {
    func initialize() {
        self.backgroundColor = UIColor.white
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func selected(color: UIColor) {
        self.backgroundColor = color
        self.contentView.layer.borderWidth = 2
    }
}
