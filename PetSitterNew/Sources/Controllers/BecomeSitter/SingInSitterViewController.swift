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
        button.alpha = 0
        button.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return button
    }()
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        return button
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
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveLinear) {
            self.nextButton.alpha = 1
            self.previousButton.alpha = 1
            self.view.layoutIfNeeded()
        }
    }

//    MARK: - Setups

    private func setupHierarhy() {
        view.addSubview(nextButton)
        view.addSubview(previousButton)
    }
    
    private func setupLayout() {
        nextButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-15)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        previousButton.snp.makeConstraints { make in
            make.top.equalTo(nextButton.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(300)
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

