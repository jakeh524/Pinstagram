//
//  PostView.swift
//  PInstagram
//
//  Created by Jake Herron on 2/27/19.
//  Copyright © 2019 Jake Herron. All rights reserved.
//

import UIKit

class PostView: UIView{
    var imageView = UIImageView()
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        imageView.image = UIImage(named: String(arc4random_uniform(4) + 1))
        label.text = "420 likes"
        
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePhoto() {
        imageView.image = UIImage(named: String(arc4random_uniform(4) + 1))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding:CGFloat = 10
        let labelPadding:CGFloat = 7
        
        
        label.sizeToFit()
        label.frame.origin.x = self.frame.width - padding - label.frame.width
        label.frame.origin.y = self.frame.height - labelPadding - label.frame.height
        
        imageView.frame.origin.x = padding
        imageView.frame.origin.y = padding
        imageView.frame.size.width = self.frame.width - padding * 2
        imageView.frame.size.height = self.frame.height - padding - (labelPadding * 2) - label.frame.height
    }
    
}
