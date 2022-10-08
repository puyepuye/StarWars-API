//
//  PostList.swift
//  Starwars
//
//  Created by KMIDS on 8/10/2565 BE.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    //while loading api call set it to empty
    var body: some View {
        List(posts) { post in
            Text(post.title)
        }
        .onAppear{
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
        
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
