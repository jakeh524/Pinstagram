//
//  ProfileTableViewController.swift
//  PInstagram
//
//  Created by Jake Herron on 2/27/19.
//  Copyright © 2019 Jake Herron. All rights reserved.
//

import UIKit

class ProfileTableViewController : UITableViewController{
    var savedPosts: [Post] = [
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return(1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as? ProfileTableViewCell else {
            fatalError()
        }
        
        let post = savedPosts[indexPath.row]
        cell.configure(image: post.image, numLikes: post.numLikes)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -100
        {
            dismiss(animated: true, completion: nil);
        }
    }
}
