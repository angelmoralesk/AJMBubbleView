//
//  AJMView.swift
//  ConstraintSample
//
//  Created by Morales, Angel (MX - Mexico) on 04/11/18.
//  Copyright © 2018 TheKairuz. All rights reserved.
//

import UIKit

class AJMView: UIView {
    
    var customConstraints : [NSLayoutConstraint]!
    
    private var iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "tomHardy")
        return imageView
    }()
    
    private lazy var ajmBadge: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var notificationLabel : UILabel = {
        let notificationLabel = UILabel()
        notificationLabel.textColor = UIColor.white
        notificationLabel.translatesAutoresizingMaskIntoConstraints = false
        return notificationLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(image : UIImage) {
        iconImageView.image = image
        iconImageView.contentMode = .scaleAspectFill
    }
    
    func updateBadge(_ numberOfNotifications : Int) {
        
        let hasNotifications = numberOfNotifications > 0
        notificationLabel.text = "\(numberOfNotifications)"
        
        UIView.animate(withDuration: 0.7, animations: { [weak self] in
            self?.ajmBadge.isHidden = !hasNotifications
        })
    }
    
    private func addSubviews() {
        addSubview(iconImageView)
        addSubview(ajmBadge)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        iconImageView.layer.cornerRadius = self.bounds.width / 2
        iconImageView.clipsToBounds = true
        ajmBadge.layer.cornerRadius = ajmBadge.frame.width / 2
        ajmBadge.clipsToBounds = true

    }
    
    override func updateConstraints() {
        if customConstraints == nil {
            let top = iconImageView.topAnchor.constraint(equalTo: topAnchor)
            let bottom = iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            let leading = iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
            let trailing = iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
            let badgeWidth = ajmBadge.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
            let badgeHeight = ajmBadge.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
            let badgeTop = ajmBadge.topAnchor.constraint(equalTo: topAnchor, constant: -6)
            let badgeTrailing = ajmBadge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5)
            
            ajmBadge.addSubview(notificationLabel)
            let centerXLabel = notificationLabel.centerXAnchor.constraint(equalTo: ajmBadge.centerXAnchor)
            let centerYLabel = notificationLabel.centerYAnchor.constraint(equalTo: ajmBadge.centerYAnchor)
            
            customConstraints = [top, bottom, leading, trailing, badgeWidth, badgeHeight, badgeTop, badgeTrailing, centerXLabel, centerYLabel]

            NSLayoutConstraint.activate(customConstraints)
        }
        super.updateConstraints()
        print("updateConstraints")
    }

    // Agregue este comentario para trabajar los pull requests con forks

}
