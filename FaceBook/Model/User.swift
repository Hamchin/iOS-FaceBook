//
//  User.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/27.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

struct User {
    var id: Int
    var name: String
    var imageName: String

    init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
}
