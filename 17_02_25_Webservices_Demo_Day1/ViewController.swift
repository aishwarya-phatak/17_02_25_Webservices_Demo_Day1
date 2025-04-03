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
            
            var jsonResponse = try! JSONSerialization.jsonObject(with: data!)
        }
        
        dataTask?.resume()
    }
}
