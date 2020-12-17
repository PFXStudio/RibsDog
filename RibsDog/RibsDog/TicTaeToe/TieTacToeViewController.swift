//
//  TieTaeToeViewController.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/16.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

fileprivate struct Constants {
    static let sectionCount = 1
    static let cellSize: CGFloat = UIScreen.main.bounds.width / CGFloat(GameConstants.maxRow)
    static let cellIdentifier = "TicTacToeCell"
    static let defaultColor = UIColor.white
}

protocol TieTaeToePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TieTaeToeViewController: UIViewController, TieTaeToePresentable, TieTaeToeViewControllable {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var listener: TieTaeToePresentableListener?
    override func viewDidLoad() {
        super.viewDidLoad()
        buildCollectionView()
    }
    
    private func buildCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
}

