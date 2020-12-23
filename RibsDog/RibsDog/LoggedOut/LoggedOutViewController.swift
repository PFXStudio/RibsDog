//
//  LoggedOutViewController.swift
//  RibsDog
//
//  Created by PFXStudio on 2020/12/15.
//  Copyright © 2020 help.nyon. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func requestLogin(player1: String, player2: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    @IBOutlet weak var playerTextField1: UITextField!
    @IBOutlet weak var playerTextField2: UITextField!
    
    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchedLoginButton(_ sender: Any) {
        let player1 = self.playerTextField1.text == "" ? "player1" : self.playerTextField1.text
        let player2 = self.playerTextField2.text == "" ? "player2" : self.playerTextField2.text
        self.listener?.requestLogin(player1: player1!, player2: player2!)
    }
}
