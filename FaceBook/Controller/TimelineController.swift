//
//  TimelineController.swift
//  FaceBook
//
//  Created by Kenta Terada on 2020/06/27.
//  Copyright © 2020 Kenta Terada. All rights reserved.
//

import UIKit

class TimelineController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var user: User?
    private var users: [User] = []
    private var timelines: [Timeline] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)

        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.users = self.createUsers()
        self.timelines = self.createTimelines()
        self.user = self.getUserById(id: 1)

        self.tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "post" {
            guard let postController = segue.destination as? PostController else { return }
            guard let user = sender as? User else { return }
            postController.delegate = self
            postController.user = user
        }
    }

    private func getUserById(id: Int) -> User? {
        let users = self.users.filter { user in id == user.id }
        let user = users.isEmpty ? nil : users[0]
        return user
    }

}

extension TimelineController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // let storyboard = UIStoryboard(name: "Main", bundle: nil)
            // let controller = storyboard.instantiateViewController(identifier: "PostController")
            // guard let postController = controller as? PostController else { return }
            // postController.modalPresentationStyle = .fullScreen
            // self.present(postController, animated: true, completion: nil)
            self.performSegue(withIdentifier: "post", sender: self.user)
        }
    }

}

extension TimelineController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timelines.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Post Cell", for: indexPath)
            guard let postCell = cell as? PostCell else { return cell }
            postCell.user = self.user
            return postCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Timeline Cell", for: indexPath)
            guard let timelineCell = cell as? TimelineCell else { return cell }
            timelineCell.timeline = self.timelines[indexPath.row - 1]
            return timelineCell
        }
    }

}

extension TimelineController: PostControllerDelegate {

    func postController(_ viewController: PostController, timeline: Timeline) {
        var timeline = timeline
        timeline.id = self.timelines.count + 1
        self.timelines.insert(timeline, at: 0)
        self.tableView.reloadData()
    }

}

extension TimelineController {

    private func createUsers() -> [User] {
        var users: [User] = []
        users.append(User(id: 1, name: "Hamchin", imageName: "Hamchin"))
        users.append(User(id: 2, name: "Mark Zuckerberg", imageName: "MarkZuckerberg"))
        users.append(User(id: 3, name: "Drew Houston", imageName: "DrewHouston"))
        users.append(User(id: 4, name: "Jack Dorsey", imageName: "JackDorsey"))
        users.append(User(id: 5, name: "Travis Kalanick", imageName: "TravisKalanick"))
        users.append(User(id: 6, name: "Brian Chesky", imageName: "BrianChesky"))
        users.append(User(id: 7, name: "Sunder Pechai", imageName: "SunderPechai"))
        users.append(User(id: 8, name: "Steve Jobs", imageName: "SteveJobs"))
        users.append(User(id: 9, name: "Susan Wojcicki", imageName: "SusanWojcicki"))
        users.append(User(id: 10, name: "Jeff Weiner", imageName: "JeffWeiner"))
        users.append(User(id: 11, name: "Stewart Butterfield", imageName: "StewartButterfield"))
        users.append(User(id: 12, name: "Evan Spiegel", imageName: "EvanSpiegel"))
        users.append(User(id: 13, name: "Sean Rad", imageName: "SeanRad"))
        return users
    }

    private func createTimelines() -> [Timeline] {
        var timelines: [Timeline] = []
        timelines.append(Timeline(id: 13, user: self.getUserById(id: 1), body: "おなかすいた", commentCount: 7, likeCount: 98, isLiked: false))
        timelines.append(Timeline(id: 12, user: self.getUserById(id: 2), body: "In a world that's changing really quickly, the only strategy that is guaranteed to fail is not taking risks.", commentCount: 12, likeCount: 129, isLiked: true))
        timelines.append(Timeline(id: 11, user: self.getUserById(id: 3), body: "The hardest-working people don’t work hard because they’re disciplined. They work hard because working on an exciting problem is fun.", commentCount: 90, likeCount: 53, isLiked: false))
        timelines.append(Timeline(id: 10, user: self.getUserById(id: 4), body: "A founder is not a job, it's a role, an attitude. And it's something that can happen again and again and again, and in fact it has to happen again and again and again, otherwise we would not move forward.", commentCount: 62, likeCount: 22, isLiked: true))
        timelines.append(Timeline(id: 9, user: self.getUserById(id: 5), body: "Uber is efficiency with elegance on top. That’s why I buy an iPhone instead of an average cell phone, why I go to a nice restaurant and pay a little bit more. It’s for the experience", commentCount: 32, likeCount: 98, isLiked: false))
        timelines.append(Timeline(id: 8, user: self.getUserById(id: 6), body: "Build something 100 people love, not something 1 million people kind of like.", commentCount: 33, likeCount: 98, isLiked: false))
        timelines.append(Timeline(id: 7, user: self.getUserById(id: 7), body: "With a few clicks, you can get about ten applications installed on your computer, and we'll help you keep them up to date.", commentCount: 12, likeCount: 76, isLiked: true))
        timelines.append(Timeline(id: 6, user: self.getUserById(id: 8), body: "That’s been one of my mantras — focus and simplicity. Simple can be harder than complex; you have to work hard to get your thinking clean to make it simple.", commentCount: 12, likeCount: 98, isLiked: true))
        timelines.append(Timeline(id: 5, user: self.getUserById(id: 9), body: "Though we do need more women to graduate with technical degrees, I always like to remind women that you don't need to have science or technology degrees to build a career in tech.", commentCount: 190, likeCount: 33, isLiked: false))
        timelines.append(Timeline(id: 4, user: self.getUserById(id: 10), body: "In order to inspire people, that's going to have to come from somewhere deep inside of you.", commentCount: 1, likeCount: 87, isLiked: true))
        timelines.append(Timeline(id: 3, user: self.getUserById(id: 11), body: "I think there’s a deep impulse in most humans to do creative stuff, whether that’s music or art, photography or writing. Most people at some point in their life say they want to do something creative… Enabling and empowering that is a very powerful force in human nature and I think it’s always been there.", commentCount: 12, likeCount: 23, isLiked: false))
        timelines.append(Timeline(id: 2, user: self.getUserById(id: 12), body: "There are very few people in the world who get to build a business like this. I think trading that for some short-term gain isn’t very interesting.", commentCount: 12, likeCount: 19, isLiked: false))
        timelines.append(Timeline(id: 1, user: self.getUserById(id: 13), body: "She’s one of the most beautiful women I’ve ever seen but it doesn’t mean that I want to rip her clothes off and have sex with her. Attraction is nuanced. I’ve been attracted to women who are …’ he pauses ‘… well, who my friends might think are ugly. I don’t care if someone is a model. Really. It sounds clichéd and almost totally unbelievable for a guy to say this, but it’s true. I need an intellectual challenge.", commentCount: 12, likeCount: 320, isLiked: true))
        return timelines
    }

}
