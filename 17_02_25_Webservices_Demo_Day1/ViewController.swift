//
//  ViewController.swift
//  17_02_25_Webservices_Demo_Day1
//
//  Created by Vishal Jagtap on 02/04/25.
//

import UIKit

class ViewController: UIViewController {

    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var comments : [Comment] = []
    var commentTableViewCell : CommentTableViewCell?
    private let reuseIdentifierForCommentTableViewCell = "CommentTableViewCell"
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        jsonSerialization()
        registerCellWithTableView()
    }
    
    func registerCellWithTableView(){
        let uiNib = UINib(nibName: reuseIdentifierForCommentTableViewCell, bundle: nil)
        self.commentsTableView.register(uiNib, forCellReuseIdentifier: reuseIdentifierForCommentTableViewCell)
    }
    
    func initSettings(){
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        url = URL(string: Constants.urlString)
        urlRequest = URLRequest(url: url!)
        urlSession = URLSession(configuration: .default)
    }
    
    func jsonSerialization(){
        var dataTask = urlSession?.dataTask(with: urlRequest!){
            data,res,error in
            
            let response = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
//            print(response)
        
            for eachComment in response{
                let postId = eachComment["postId"] as! Int
                let id = eachComment["id"] as! Int
                let name = eachComment["name"] as! String
                let email = eachComment["email"] as! String
                let body = eachComment["body"] as! String
                
                let commentObject = Comment(postId: postId,
                                                     id: id,
                                                     name: name,
                                                     email: email,
                                                     body: body)
                
                self.comments.append(commentObject)
                
                print("Swift Array of comments -- \(self.comments)")
            }
            
            DispatchQueue.main.async {
                self.commentsTableView.reloadData()
            }
        }
        dataTask?.resume()
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        commentTableViewCell = self.commentsTableView.dequeueReusableCell(withIdentifier: reuseIdentifierForCommentTableViewCell, for: indexPath) as? CommentTableViewCell
        
        commentTableViewCell?.commentIdLabel.text = "\(comments[indexPath.row].id)"
        commentTableViewCell?.commentEmailLabel.text = comments[indexPath.row].email
        commentTableViewCell?.commentNameLabel.text = comments[indexPath.row].name
        commentTableViewCell?.commentBodyLabel.text = comments[indexPath.row].body
        
        return commentTableViewCell ?? UITableViewCell()
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165.0
    }
}
