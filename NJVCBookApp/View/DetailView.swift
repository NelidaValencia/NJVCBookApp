//
//  DetailView.swift
//  NJVCBookApp
//
//  Created by Slacker on 5/05/23.
//

import SwiftUI

struct DetailView: View {
    @State private var animationContent : Bool = false
    @State private var offSetAnimation : Bool = false
    var animation: Namespace.ID
    var book: Book
    @Binding var show: Bool 
    var body: some View {
        VStack(spacing: 15){
            Button {
                withAnimation(.easeInOut(duration: 0.35)) {
                    offSetAnimation = false
                    show = false
                }
                withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                    animationContent = false
                    show = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .contentShape(Rectangle())
            }
            .padding([.leading, .vertical], 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(animationContent ? 1 : 0)
            
            GeometryReader {
                let size = $0.size
                HStack(spacing: 20) {
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (size.width - 30) / 2, height: size.height)
                        .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 20))
                        .matchedGeometryEffect(id: book.id, in: animation)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("By \(book.author)")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        RatingView(rating: book.rating)
                    }
                    .padding(.trailing, 15)
                    .padding(.trailing, 30)
                    .offset(y: offSetAnimation ? 0 : 100)
                    .opacity(offSetAnimation ? 1 : 0)
                }
            }
            .frame(height: 220)
            
            Rectangle()
                .fill(.gray.opacity(0.04))
                .ignoresSafeArea()
                .overlay(alignment: .top, content: {
                    BooksDetail()
                })
                .padding(.leading, 30)
                .padding(.top, -180)
                .zIndex(0)
                .opacity(animationContent ? 1 : 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background{
            Rectangle()
                .fill(.white)
                .ignoresSafeArea()
                .opacity(animationContent ? 1 : 0)
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 0.35)) {
                animationContent = true
            }
            
            withAnimation(.easeInOut(duration: 0.35).delay(0.1)) {
                offSetAnimation = true
            }
        }
    }
    
    func BooksDetail() -> some View {
        VStack (spacing: 0) {
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Label("Reviews", systemImage: "text.alignleft")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    Label("Like", systemImage: "suit.heart")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    
                } label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)

            }
            Divider()
                .padding(.top, 25)
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15) {
                    Text("About the book")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 15)
                .padding(.top, 20)
            }
            Spacer(minLength: 10)
            Button {
                
            } label: {
                Text("Read now")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 45)
                    .padding(.vertical, 10)
                    .background{
                        Capsule()
                            .fill(Color.blue.gradient)
                    }
                    .foregroundColor(.white)
            }
            .padding(.bottom, 20)
            
        }
        .padding(.top, 180)
        .padding([.horizontal, .top], 15)
        .offset(y: offSetAnimation ? 0 : 100)
        .opacity(offSetAnimation ? 1 : 0)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
