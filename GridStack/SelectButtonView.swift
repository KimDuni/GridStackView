//
//  SelectButtonView.swift
//  GridStack
//
//  Created by 김성준 on 2022/09/05.
//

import UIKit
import SnapKit

final class SelectButtonView: UIView {
    let titleLabel = UILabel.init()
    
    init(title: String) {
        super.init(frame: .zero)
        layer.cornerRadius = 4.4
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        
        setTitleLabel(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitleLabel(title: String) {
        titleLabel.text = title
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
