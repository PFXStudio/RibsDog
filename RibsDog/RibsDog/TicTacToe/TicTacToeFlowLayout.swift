//
//  TicTacToeFlowLayout.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import Foundation
import UIKit

class TicTacToeFlowLayout: UICollectionViewFlowLayout {
    func initialize() {
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        let width: CGFloat = UIScreen.main.bounds.width / CGFloat(GameConstant.maxCol)
        self.itemSize = CGSize(width: width, height: width)
    }
}
