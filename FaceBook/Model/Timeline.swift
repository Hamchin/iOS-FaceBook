//
//  Timeline.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/27.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

struct Timeline {
    var id: Int
    var user: User?
    var body: String
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool

    init(id: Int, user: User?, body: String, commentCount: Int, likeCount: Int, isLiked: Bool) {
        self.id = id
        self.user = user
        self.body = body
        self.commentCount = commentCount
        self.likeCount = likeCount
        self.isLiked = isLiked
    }
}
