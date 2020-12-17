//
//  TieTaeToeInteractor.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/16.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift

struct GameConstants {
    static let maxRow = 3
    static let maxCol = 3
}

protocol TieTaeToeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol TieTaeToePresentable: Presentable {
    var listener: TieTaeToePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol TieTaeToeListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class TieTaeToeInteractor: PresentableInteractor<TieTaeToePresentable>, TieTaeToeInteractable, TieTaeToePresentableListener {

    weak var router: TieTaeToeRouting?
    weak var listener: TieTaeToeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: TieTaeToePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
