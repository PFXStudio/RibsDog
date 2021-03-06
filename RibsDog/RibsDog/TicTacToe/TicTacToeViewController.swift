//
//  TicTacToeViewController.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

fileprivate struct Constants {
    static let sectionCount = 1
    static let cellSize: CGFloat = UIScreen.main.bounds.width / CGFloat(GameConstant.maxCol)
    static let identifier = String(describing: TicTacToeCell.self)
    static let defaultColor = UIColor.white
}

enum TicTacToeRequestType {
    case completed
    case viewDidLoad
    case placeCurrentPlayerMark(row: Int, col: Int)
}
protocol TicTacToePresentableListener: class {
    var requestSubject: PublishSubject<TicTacToeRequestType> { get }
}

final class TicTacToeViewController: UIViewController, TicTacToePresentable, TicTacToeViewControllable {
    weak var listener: TicTacToePresentableListener?
    var updateCellSubject = PublishSubject<(row: Int, col: Int, playerType: PlayerType)>()
    var showAnnounceSubject = PublishSubject<String>()
    private var disposeBag = DisposeBag()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        guard let layout = collectionView.collectionViewLayout as? TicTacToeFlowLayout else { return }
        layout.initialize()
        self.updateCellSubject.asObserver()
            .subscribe { [weak self] (row, col, playerType) in
                guard let self = self, let cell = self.collectionView.cellForItem(at: IndexPath(row: row * GameConstant.maxCol + col, section: 0)) as? TicTacToeCell else { return }
                cell.selected(color: playerType.color)
            }
            .disposed(by: self.disposeBag)
        
        self.showAnnounceSubject.asObserver()
            .subscribe(onNext: { [weak self] message in
                guard let self = self else { return }
                let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close Game", style: UIAlertAction.Style.default) { [weak self] _ in
                    guard let self = self else { return }
                    self.listener?.requestSubject.onNext(.completed)
                }
                alert.addAction(closeAction)
                self.present(alert, animated: true, completion: nil)
            })
            .disposed(by: self.disposeBag)
        self.listener?.requestSubject.onNext(.viewDidLoad)
    }
}

extension TicTacToeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameConstant.maxCol * GameConstant.maxRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifier, for: indexPath) as? TicTacToeCell else {
            return UICollectionViewCell()
        }
        
        cell.initialize()
        return cell
    }
}

extension TicTacToeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row / GameConstant.maxCol
        let col = indexPath.row - (row * GameConstant.maxRow)
        listener?.requestSubject.onNext(.placeCurrentPlayerMark(row: row, col: col))
    }
}
