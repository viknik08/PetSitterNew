//
//  ChoicePetViewController.swift
//  PetSitterNew
//
//  Created by Виктор Басиев on 04.09.2022.
//


import UIKit
import SnapKit

class ChoicePetViewController: UIViewController {
    
    let pets = ["Dog", "Cat", "Another"]
    
//    MARK: - Outlets
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Which pet do you have?"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        label.alpha = 0
        return label
    }()
    private let petTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "What kind of pet"
        textField.textColor = .black
        textField.layer.cornerRadius = 10
        textField.alpha = 0
        return textField
    }()
    private lazy var petPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.alpha = 0
        return picker
    }()
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
        view.backgroundColor = .systemRed
        setupHierarhy()
        setupLayout()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveLinear) {
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.9, delay: 0, options: .curveLinear) {
            self.petPicker.alpha = 1
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.nextButton.alpha = 1
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.previousButton.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
//    MARK: - Setups

    private func setupHierarhy() {
        view.addSubviews([titleLabel, petPicker, petTextField, nextButton, previousButton])
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(petPicker.snp.top)
            make.centerX.equalTo(view)
        }
        petPicker.snp.makeConstraints { make in
            make.bottom.equalTo(petTextField.snp.top)
            make.centerX.equalTo(view)
        }
        petTextField.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(nextButton.snp.top).offset(-30)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
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

extension ChoicePetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
//    dataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pets.count
    }
    
//    delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pets[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("choice \(row) in \(component)")
        if row == 2 {
            UIView.animate(withDuration: 0.5) {
                self.petTextField.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.petTextField.alpha = 0
            }
        }
    }
}
