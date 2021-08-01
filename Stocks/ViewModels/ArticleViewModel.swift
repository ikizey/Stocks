//
//  ArticleViewModel.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import Foundation

struct ArticleViewModel {
    
    let article: Article
    
    var imageURL: String {
        article.imageURL
    }
    
    var title: String {
        article.title
    }
    
    var publication: String {
        article.publication.uppercased()
    }
    
}
