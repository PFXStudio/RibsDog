//
//  RootViewController.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

// Router -> ViewController 전달이 필요한 경우 ViewControllable 프로토콜 채택
final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    
    func present(viewController: ViewControllable) {
        self.present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension RootViewController: LoggedInViewControllable {
    
}
