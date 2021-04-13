//
//  ContentView.swift
//  Books-iOS
//
//  Created by Mattia Fasoli on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    var books: [Book] = [
        Book.init(title: "Clean Code", link: "https://amzn.to/2YqSuEu", image: UIImage(imageLiteralResourceName: "cleancode")),
        Book.init(title: "Elegant Objects", link: "https://amzn.to/32N4dgB", image: UIImage(imageLiteralResourceName: "elegantobjects")),
        Book.init(title: "Design Patterns", link: "https://amzn.to/2YkHCZ2", image: UIImage(imageLiteralResourceName: "designpatterns"))
    ]
    
    @State var searchIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List(
                    books,
                    id: \.title,
                    rowContent: { book in
                    
                        NavigationLink(
                            destination: Text(book.title),
                            label: {
                                Image(uiImage: book.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 160)
                                    .cornerRadius(8)
                                    .shadow(radius: 20)
                                    .padding([.top, .bottom])
                                
                                VStack (alignment: .leading) {
                                    Text(book.title)
                                        .fontWeight(.bold)
                                    Text(book.link)
                                        .font(.callout)
                                }
                            })
                        
                })
            }
            .navigationBarTitle("Programming Books")
            .navigationBarItems(trailing: Button(action: {
                self.searchIsPresented.toggle()
            }, label: {Text("Search")}))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $searchIsPresented, content: {
            VStack {
                Text("Search View")
                Spacer()
                Button(action: {
                    self.searchIsPresented.toggle()
                }, label: {
                    Text("Close")
                })
            }
            .padding()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
