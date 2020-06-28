//
//  PostCell.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/28.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!

    var user: User? {
        didSet {
            guard let user = self.user else { return }
            self.profileImageView.image = UIImage(named: user.imageName)
        }
    }

}
