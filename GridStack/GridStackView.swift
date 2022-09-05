//
//  GridStackView.swift
//  GridStack
//
//  Created by 김성준 on 2022/09/05.
//

import UIKit

protocol GridStackViewDelegate {
    func gridStackView(view: GridStackView, didTapped index: Int)
}

final class GridStackView: UIView {
    private var stackRow = [UIStackView].init()
    private var itemViews = [UIView].init()
    private let verticalStack = UIStackView.init()
    
    let verticalItemCount: Int
    let horizontalItemCount: Int
    let spacing: CGFloat = 10
    
    var delegate: GridStackViewDelegate?
    
    init(verticalItemCount: Int, horizontalItemCount: Int) {
        self.verticalItemCount = verticalItemCount
        self.horizontalItemCount = horizontalItemCount
        super.init(frame: .zero)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        verticalStack.axis = .vertical
        verticalStack.spacing = spacing
        verticalStack.distribution = .fillEqually
        addSubview(verticalStack)
        verticalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        ( 0 ..< verticalItemCount ).forEach { _ in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = spacing
            stackRow.append(stackView)
            verticalStack.addArrangedSubview(stackView)
        }
        
        stackRow.forEach { parentStackView in
            ( 0 ..< horizontalItemCount ).forEach { _ in
                let itemView = UIView()
                parentStackView.addArrangedSubview(itemView)
                itemViews.append(itemView)
            }
        }
    }
    
    func append(items views: [UIView]) {
        views.enumerated().forEach { item in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedView(_:)))
            item.element.addGestureRecognizer(tapGesture)
            item.element.tag = item.offset
            item.element.isUserInteractionEnabled = true
            itemViews[item.offset].addSubview(item.element)
            item.element.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    @objc
    func tappedView(_ sender: UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            delegate?.gridStackView(view: self, didTapped: tag)
        }
    }
}
