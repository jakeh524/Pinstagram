//
//  ProfileTableViewCell.swift
//  PInstagram
//
//  Created by Jake Herron on 2/27/19.
//  Copyright © 2019 Jake Herron. All rights reserved.
//

import UIKit

class ProfileTableViewCell : UITableViewCell{
    var postView = PostView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(postView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        postView.frame = self.bounds
    }
    
    func configure(image: UIImage?, numLikes: Int){
        postView.imageView.image = image
        postView.label.text = String(numLikes) + " likes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
