//
//  PostController.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/27.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

protocol PostControllerDelegate {
    func postController(_ viewController: PostController, timeline: Timeline)
}

class PostController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postButton: UIBarButtonItem!

    var user: User?
    var delegate: PostControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.postTextView.delegate = self

        if let user = self.user {
            self.profileImageView.image = UIImage(named: user.imageName)
            self.userNameLabel.text = user.name
        }
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func postButtonTapped(_ sender: Any) {
        let timeline = Timeline(id: 0, user: self.user, body: postTextView.text, commentCount: 0, likeCount: 0, isLiked: false)
        self.delegate?.postController(self, timeline: timeline)
        self.dismiss(animated: true, completion: nil)
    }

}

extension PostController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            placeholderLabel.isHidden = false
            postButton.isEnabled = false
        }
        else {
            placeholderLabel.isHidden = true
            postButton.isEnabled = true
        }
    }

}
