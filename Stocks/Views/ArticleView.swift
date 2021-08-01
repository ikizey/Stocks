//
//  ArticleView.swift
//  Stocks
//
//  Created by PrincePhoenix on 01.08.2021.
//

import SwiftUI

struct ArticleView: View {
    
    let articles: [ArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        return VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView {
                    VStack {
                        ForEach(articles, id: \.title) { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                    Text(article.title)
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = Article(title: "News Title",
                              imageURL: "https://prod.static9.net.au/_/" +
                              "media/2019/02/10/36/nine_news_melbourne_" +
                              "1600x900_fullstory_nigtly6pm.jpg",
                              publication: "The WSJ")
        
        return ArticleView(articles: [ArticleViewModel(article: article)])
            .previewLayout(.sizeThatFits)
    }
}
