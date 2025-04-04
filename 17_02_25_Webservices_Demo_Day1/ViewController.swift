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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        jsonSerialization()
    }
    
    func initSettings(){
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
        }
        dataTask?.resume()
    }
}
