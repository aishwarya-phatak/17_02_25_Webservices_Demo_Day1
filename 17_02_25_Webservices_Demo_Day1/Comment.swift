//
//  Post.swift
//  17_02_25_Webservices_Demo_Day1
//
//  Created by Vishal Jagtap on 03/04/25.
//


struct Comment : Decodable{
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
