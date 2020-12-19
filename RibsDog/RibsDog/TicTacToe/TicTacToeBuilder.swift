//
//  TicTacToeBuilder.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/17.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol TicTacToeDependency: Dependency {
    var player1Name: String { get }
    var player2Name: String { get }
}

final class TicTacToeComponent: Component<TicTacToeDependency> {
    fileprivate var player1Name: String {
        return dependency.player1Name
    }
    fileprivate var player2Name: String {
        return dependency.player2Name
    }
}

// MARK: - Builder

protocol TicTacToeBuildable: Buildable {
    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting
}

final class TicTacToeBuilder: Builder<TicTacToeDependency>, TicTacToeBuildable {

    override init(dependency: TicTacToeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TicTacToeListener) -> TicTacToeRouting {
        let component = TicTacToeComponent(dependency: dependency)
        let identifier = String(describing: TicTacToeViewController.self)
        let viewController = UIStoryboard(name: identifier, bundle: nil).instantiateViewController(withIdentifier: identifier) as! TicTacToeViewController
        let interactor = TicTacToeInteractor(presenter: viewController,
                                             player1Name: component.player1Name,
                                             player2Name: component.player2Name)
        interactor.listener = listener
        return TicTacToeRouter(interactor: interactor, viewController: viewController)
    }
}
