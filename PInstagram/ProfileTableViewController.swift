//
//  ProfileTableViewController.swift
//  PInstagram
//
//  Created by Jake Herron on 2/27/19.
//  Copyright © 2019 Jake Herron. All rights reserved.
//

import UIKit
import Photos

class ProfileTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var savedPosts: [Post] = [
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420),
        Post(image: UIImage(named: "bg"), numLikes: 420)
    ]
    
    var createButton = UIButton()
    var tableVC = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVC.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        tableVC.dataSource = self
        tableVC.delegate = self
        
        createButton.setTitle("Create Post", for: .normal)
        createButton.backgroundColor = .yellow
        view.addSubview(tableVC)
        view.addSubview(createButton)
    }
    
    override func viewWillLayoutSubviews() {
        let buttonHeight : CGFloat = 80
        
        var tableViewFrame = CGRect.zero
        tableViewFrame.size.width = view.frame.width
        tableViewFrame.size.height = view.frame.height - buttonHeight
        tableViewFrame.origin.x = view.frame.minX
        tableViewFrame.origin.y = view.frame.minY
        
        tableVC.frame = tableViewFrame
        
        var createButtonFrame = CGRect.zero
        createButtonFrame.size.width = view.frame.width
        createButtonFrame.size.height = buttonHeight
        createButtonFrame.origin.x = view.frame.minX
        createButtonFrame.origin.y = view.frame.maxY - buttonHeight
        createButton.frame = createButtonFrame
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return(1)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as? ProfileTableViewCell else {
            fatalError()
        }
        
        let post = savedPosts[indexPath.row]
        cell.configure(image: post.image, numLikes: post.numLikes)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -100
        {
            dismiss(animated: true, completion: nil);
        }
    }
    
    @objc func makePost()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        
        
    }
}
