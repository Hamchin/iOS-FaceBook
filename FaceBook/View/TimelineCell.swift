//
//  TimelineCell.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/27.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!

    var timeline: Timeline? {
        didSet {
            guard let timeline = self.timeline else { return }
            guard let user = timeline.user else { return }
            self.profileImageView.image = UIImage(named: user.imageName)
            self.userNameLabel.text = user.name
            self.bodyTextView.text = timeline.body
            self.likeCountLabel.text = "\(timeline.likeCount) Liked"
            self.commentCountLabel.text = "\(timeline.commentCount) Comments"
        }
    }

}
