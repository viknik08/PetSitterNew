//
//  SingInSitterViewController.swift
//  PetSitterNew
//
//  Created by Виктор Басиев on 04.09.2022.
//

import UIKit
import SnapKit

class SingInSitterViewController: UIViewController {
    
//    MARK: - Outlets
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return button
    }()
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        return button
    }()
    private let stackForTextField: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        return stack
    }()
    private let stackForButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.alpha = 0
        return stack
    }()
    private let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter you name"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        return textField
    }()
    private let secondNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter you second name"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter you phone number"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter you email"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter you password"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Registration"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()

//    MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupHierarhy()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear) {
            self.mainStack.alpha = 1
            self.view.layoutIfNeeded()
        }
    }

//    MARK: - Setups

    private func setupHierarhy() {
        view.addSubview(mainStack)
        mainStack.addArrangedSubviews([titleLabel, stackForTextField, stackForButton])
        stackForTextField.addArrangedSubviews([firstNameTextField, secondNameTextField, phoneNumberTextField, emailTextField, passwordTextField])
        stackForButton.addArrangedSubviews([previousButton, nextButton])
    }
    
    private func setupLayout() {
        mainStack.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.center.equalTo(view)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(mainStack)
        }
        stackForTextField.snp.makeConstraints { make in
            make.right.equalTo(mainStack).inset(20)
            make.left.equalTo(mainStack).offset(20)
        }
        stackForButton.snp.makeConstraints { make in
            make.left.equalTo(mainStack).offset(20)
            make.right.equalTo(mainStack).inset(20)
        }
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        previousButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
//    MARK: - Action

    @objc func nextAction() {
//        let viewController = ChoicePetViewController()
//        viewController.modalPresentationStyle = .fullScreen
//        present(viewController, animated: true)
    }
    
    @objc func previousAction() {
        dismiss(animated: true)
    }
}

//    MARK: - Extension

