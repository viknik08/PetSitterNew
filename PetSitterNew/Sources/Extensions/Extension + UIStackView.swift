//
//  Extension + UIStackView.swift
//  PetSitterNew
//
//  Created by Виктор Басиев on 05.09.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach { addArrangedSubview($0) }
    }
}
