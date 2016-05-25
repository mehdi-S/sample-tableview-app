//
//  PostCell.swift
//  my-hood
//
//  Created by Mehdi Silini on 25/05/2016.
//  Copyright © 2016 Mehdi Silini. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        
    }
    
    func configureCell(post: Post) {
        titleLabel.text = post.postTitle
        descriptionLabel.text = post.postDescription
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }

}
