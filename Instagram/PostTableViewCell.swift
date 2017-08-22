//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 三宅亮輔 on 2017/08/22.
//  Copyright © 2017年 dosueeee. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postText: UILabel!
    
    @IBOutlet weak var likeButton: DesignableButton!
    @IBOutlet weak var commentButton: DesignableButton!
    
    private var currentUserDidLike: Bool = false
    
    var post: Post! {
        didSet {
        updateUI()
        }
        
    }
    
    private func updateUI() {
        
        //画像を丸める
        userProfilePic.layer.cornerRadius = userProfilePic.layer.bounds.width/2
        postImage.layer.cornerRadius = 5.0
        
        userProfilePic.clipsToBounds = true
        postImage.clipsToBounds = true
        
        userProfilePic.image! = post.user.profileImage
        usernameLabel.text! = post.user.fullName
        createdAt.text! = post.createdAt
        postImage.image! = post.postImage
        postText.text! = post.postText
        
        likeButton.setTitle("🙆 \(post.numberOfLikes)", forState: .Normal)
        
        configureButtonAppearence()
        changeLikeButtonColor()
        
    }
    
    private func configureButtonAppearence(){
    
        likeButton.cornerRadius = 3.0
        likeButton.borderWidth = 2.0
        likeButton.borderColor = UIColor.lightGrayColor()
        likeButton.tintColor = UIColor.lightGrayColor()
        
        commentButton.cornerRadius = 3.0
        commentButton.borderWidth = 2.0
        commentButton.borderColor = UIColor.lightGrayColor()
        commentButton.tintColor = UIColor.lightGrayColor()
        
    }
    
    private func changeLikeButtonColor() {
    
        if currentUserDidLike {
        
            likeButton.borderColor = UIColor(hex: "b94047")
            likeButton.tintColor = UIColor(hex: "b94047")
        } else {
            
           likeButton.borderColor = UIColor.lightGrayColor()
           likeButton.tintColor = UIColor.lightGrayColor()
        
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func likeButton_Clicked(sender: DesignableButton) {
        
        post.userDidLike = !post.userDidLike
        if post.userDidLike {
            post.numberOfLikes++
        } else{
            post.numberOfLikes--
        }
        
        likeButton.setTitle("🙆 \(post.numberOfLikes) Likes", forState: .Normal)
        
        currentUserDidLike = post.userDidLike
        changeLikeButtonColor()
        
        //animation
        sender.animation = "pop"
        sender.curve = "string"
        sender.duration = 1.5
        sender.damping = 0.1
        sender.velocity = 0.2
        sender.animate()
        
        
    }
    
    @IBAction func commentButton_Clicked(sender: DesignableButton) {
        
        //animation
        sender.animation = "pop"
        sender.curve = "string"
        sender.duration = 1.5
        sender.damping = 0.1
        sender.velocity = 0.2
        sender.animate()

        
    }
    
    
}
