//
//  Extension + UIView.swift
//  PetSitterNew
//
//  Created by Виктор Басиев on 04.09.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}

