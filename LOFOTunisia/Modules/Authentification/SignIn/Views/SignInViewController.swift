//
//  SignInViewController.swift
//  LOFOTunisia
//
//  Created by walid sassi on 12/29/19.
//  Copyright © 2019 walid sassi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SignInViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var signInFindObj2Label: UILabel!
    @IBOutlet weak var signInFindObj1Label: UILabel!
    @IBOutlet weak var fbButton: CustomButton!
    @IBOutlet weak var gmailButton: CustomButton!
    @IBOutlet weak var signInButton: CustomButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    // MARK: - Variables
    var viewModel: SignInViewModel?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        initCallBacks()
        setupColors()
        setupBinding()
        // Do any additional setup after loading the view.
    }
    // MARK: - Setup Methods
    /// setup data binding to the viewModel
    func setupBinding() {
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel!.email)
        .disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel!.password)
        .disposed(by: disposeBag)
        signInButton.rx.tap
        .bind { [weak self] in
            self?.viewModel?.submit()
        }.disposed(by: disposeBag)
        let tapGesture = UITapGestureRecognizer()
        signUpLabel.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { _ in
            self.viewModel?.openSignUp()
        }).disposed(by: disposeBag)
    }
    /// handle Keyboard resign
    func initCallBacks() {
        emailTextField.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
          print("return pressed")
        }.disposed(by: disposeBag)
        passwordTextField.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
          print("return pressed")
        }.disposed(by: disposeBag)
    }

    func setupColors() {
        fbButton.backgroundColor = UIColor.fbButtonColor()
        gmailButton.layer.borderColor = UIColor.gmailButtonBorderColor()
        signInButton.backgroundColor = UIColor.signInButtonColor()
        emailTextField.textColor = UIColor.black
        passwordTextField.textColor = UIColor.black
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.emailTextColor()])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Mot de passe",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.passwordTextColor()])
    }
    // MARK: - IBActions

    @IBAction func signInWithFbButtonClicked(_ sender: Any) {
    }
    @IBAction func signInWithGmailButtonClicked(_ sender: Any) {
    }
}
