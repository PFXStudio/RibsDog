//
//  TieTaeToeBuilder.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/16.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs

protocol TieTaeToeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TieTaeToeComponent: Component<TieTaeToeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TieTaeToeBuildable: Buildable {
    func build(withListener listener: TieTaeToeListener) -> TieTaeToeRouting
}

final class TieTaeToeBuilder: Builder<TieTaeToeDependency>, TieTaeToeBuildable {

    override init(dependency: TieTaeToeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TieTaeToeListener) -> TieTaeToeRouting {
        let component = TieTaeToeComponent(dependency: dependency)
        let identifier = String(describing: TieTaeToeViewController.self)
        let viewController = UIStoryboard(name: identifier, bundle: nil).instantiateViewController(withIdentifier: identifier) as! TieTaeToeViewController
        let interactor = TieTaeToeInteractor(presenter: viewController)
        interactor.listener = listener
        return TieTaeToeRouter(interactor: interactor, viewController: viewController)
    }
}
