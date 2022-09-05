//
//  ViewController.swift
//  GridStack
//
//  Created by 김성준 on 2022/09/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let stackView = GridStackView(verticalItemCount: 4,
                  horizontalItemCount: 4)
    
    let stackView1 = GridStackView(verticalItemCount: 4,
                  horizontalItemCount: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.delegate = self
        stackView1.delegate = self
        view.addSubview(stackView)
        view.addSubview(stackView1)
        
        stackView.snp.makeConstraints { make in
            make.leading.centerY.trailing.equalToSuperview()
            make.height.equalTo(120)
        }
        
        stackView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(stackView.snp.bottom)
            make.height.equalTo(120)
        }
        
        stackViewset()
        stackView1set()
    }
    
    func stackViewset() {
        let backGroundColor: [UIColor] = [.red, .blue, .orange, .green]
        var views = [UIView].init()
        (0..<8).forEach { i in
            let view = SelectButtonView(title: "\(i)")
            view.backgroundColor = backGroundColor.randomElement()
            views.append(view)
        }
        
        stackView.append(items: views)
    }
    
    func stackView1set() {
        let backGroundColor: [UIColor] = [.red, .blue, .orange, .green]
        var views = [UIView].init()
        (0..<8).forEach { i in
            let view = SelectButtonView(title: "\(i)")
            view.backgroundColor = backGroundColor.randomElement()
            views.append(view)
        }
        
        stackView1.append(items: views)
    }
}

extension ViewController: GridStackViewDelegate {
    func gridStackView(view: GridStackView, didTapped index: Int) {
        
    }
}

