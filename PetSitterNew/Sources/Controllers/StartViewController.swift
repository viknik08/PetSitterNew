//
//  StartViewController.swift
//  PetSitterNew
//
//  Created by Виктор Басиев on 27.08.2022.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
//    MARK: - Outlets
    private let findSitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Find Sitter", for: .normal)
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(findSitterAction), for: .touchUpInside)
        return button
    }()
    private let becomeSitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Become Sitter", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(becomeSitterAction), for: .touchUpInside)
        return button
    }()

//    MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarhy()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseIn) {
            self.findSitterButton.alpha = 1
            self.becomeSitterButton.alpha = 1
            self.view.layoutIfNeeded()
        }
    }

//    MARK: - Setups

    private func setupHierarhy() {
        view.addSubview(findSitterButton)
        view.addSubview(becomeSitterButton)
    }
    
    private func setupLayout() {
        findSitterButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(-15)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        becomeSitterButton.snp.makeConstraints { make in
            make.top.equalTo(findSitterButton.snp.bottom).offset(30)
            make.centerX.equalTo(view)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
//    MARK: - Action

    @objc func findSitterAction() {
        let viewController = ChoicePetViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @objc func becomeSitterAction() {
        let viewController = SingInSitterViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

//    MARK: - Extension
