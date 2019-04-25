//
//  TitleCollectionViewCell.swift
//  SpaceTrader
//
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    override func layoutSubviews() {
        titleLabel.frame = bounds
    }
    
    private func setup() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}
