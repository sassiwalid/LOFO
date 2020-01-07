//
//  SignUpViewController.swift
//  LOFOTunisia
//
//  Created by walid sassi on 1/2/20.
//  Copyright © 2020 walid sassi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SignUpViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var signUpButton: CustomButton!
    @IBOutlet weak var userPhotoLabel: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var confPasswordText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var subNameText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var addPhotoView: EllipseView!
    // MARK: - Variables
    var viewModel: SignUpViewModel?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        resignCallBacks()
        // Do any additional setup after loading the view.
    }
    func setupBinding() {
        signUpButton.rx.tap
            .bind { [ weak self] in
                self?.viewModel?.submit()
        }.disposed(by: disposeBag)
        nameText.rx.text.orEmpty
        .bind(to: self.viewModel!.name)
        .disposed(by: disposeBag)
        subNameText.rx.text.orEmpty
            .bind(to: viewModel!.subName)
            .disposed(by: disposeBag)
        ageText.rx.text.orEmpty
            .bind(to: viewModel!.age)
        .disposed(by: disposeBag)
        cityText.rx.text.orEmpty
            .bind(to: viewModel!.city)
        .disposed(by: disposeBag)
        passwordText.rx.text.orEmpty
            .bind(to: viewModel!.password)
        .disposed(by: disposeBag)
        confPasswordText.rx.text.orEmpty
            .bind(to: viewModel!.confirmedPassword)
        .disposed(by: disposeBag)
        emailText.rx.text.orEmpty
            .bind(to: viewModel!.email)
        .disposed(by: disposeBag)
    }
    func resignCallBacks() {
        nameText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        subNameText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        ageText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        cityText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        emailText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        passwordText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        confPasswordText.rx.controlEvent([.editingDidEndOnExit])
        .subscribe { _ in
                 print("return pressed")
        }.disposed(by: disposeBag)
        let tapGesture = UITapGestureRecognizer()
        addPhotoView.addGestureRecognizer(tapGesture)
        tapGesture.rx.event.bind(onNext: { _ in
                self.viewModel?.chooseProfilPhoto()
        }).disposed(by: disposeBag)
    }
}
