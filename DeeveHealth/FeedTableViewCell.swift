//
//  FeedTableViewCell.swift
//  DeeveHealth
//
//  Created by Shakti Pratap Singh on 05/07/17.
//  Copyright © 2017 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var message: UILabel!
    var post:Post!
    var owner:User!
    @IBAction func likeButton(_ sender: UIButton) {
        post.likes.append(owner)
        updateUI()
    }
    @IBAction func commentButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let commentViewController = storyboard.instantiateViewController(withIdentifier: "comment_vc") as! addCommentViewController
        commentViewController.owner=owner
        commentViewController.post=post
        self.window?.rootViewController?.present(commentViewController, animated: true, completion: nil)
    }
    func updateUI(){
        self.comments.text = "\(post.comments.count) comments"
        self.likes.text = "\(post.likes.count) likes"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width / 2;
        self.profilePic.clipsToBounds = true;
        let commentTap = UITapGestureRecognizer(target: self, action: #selector(commentTapFunction))
        comments.isUserInteractionEnabled = true
        comments.addGestureRecognizer(commentTap)

        let likeTap = UITapGestureRecognizer(target: self, action: #selector(likeTapFunction))
        likes.isUserInteractionEnabled = true
        likes.addGestureRecognizer(likeTap)

        // Initialization code
    }
    func commentTapFunction(){
        for comment in post.comments{
            print("\n\n "+comment.value.name+" commented \""+comment.key+"\" on you status \""+post.message+"\"\n\n")
        }
            //code to show comments
    }
    func likeTapFunction(){
        for like in post.likes{
            print("\n\n "+like.name+" liked your status \""+post.message+"\"")
        }
        //code to show likes
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
