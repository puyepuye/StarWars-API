//
//  Data.swift
//  Starwars
//
//  Created by KMIDS on 8/10/2565 BE.
//

import SwiftUI

struct Post: Codable, Identifiable {
    //anything that is Identifiable must have id
    var id = UUID()
    var title: String
    var body: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        //make the API call
        //url cannot be optional hence include ! after url => type safe or guard is safer
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async{
                completion(posts)
            }
            //allow us to interact with the app while running the API Call
        }
        .resume()
    }
}
