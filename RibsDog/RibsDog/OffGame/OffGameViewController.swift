//
//  OffGameViewController.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: class {
    func requestStart()
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?
    @IBAction func touchedStartButton(_ sender: Any) {
        self.listener?.requestStart()
    }
}
