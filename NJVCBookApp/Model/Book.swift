//
//  Book.swift
//  NJVCBookApp
//
//  Created by Slacker on 4/05/23.
//

import SwiftUI

struct Book: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var bookViews: Int
}
var sampleBooks: [Book] = [
    .init(title: "Book 1", imageName: "Book1", author: "Book Author 1", rating: 4, bookViews: 1023),
    .init(title: "Book 2", imageName: "Book2", author: "Book Author 2", rating: 5, bookViews: 2049),
    .init(title: "Book 3", imageName: "Book3", author: "Book Author 3", rating: 4, bookViews: 920),
    .init(title: "Book 4", imageName: "Book4", author: "Book Author 4", rating: 3, bookViews: 560),
    .init(title: "Book 5", imageName: "Book5", author: "Book Author 5", rating: 5, bookViews: 1023),
    .init(title: "Book 6", imageName: "Book6", author: "Book Author 6", rating: 4, bookViews: 240)
]


