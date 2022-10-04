import UIKit

/*
 Created by Evgeniy Safin
 4 october 2022
 
 Protocols & Generics. Lesson 1. Swift.
 */

// for string
func getUniqueElementsForStringArray(elements: [String]) -> [String] {
    var elements = elements
    for _ in 0..<elements.count {
        let element = elements.removeFirst()
        if !elements.contains(element) {
            elements.append(element)
        }
    }
    return elements
}
getUniqueElementsForStringArray(elements: ["1", "2", "3", "1", "1", "1"])

// for doubles
func getUniqueElementsForDoublesArray(elements: [Double]) -> [Double] {
    var elements = elements
    for _ in 0..<elements.count {
        let element = elements.removeFirst()
        if !elements.contains(element) {
            elements.append(element)
        }
    }
    return elements
}
getUniqueElementsForDoublesArray(elements: [1.2, 1.1, 1.2, 1.1, 1.3, 1.5])

// for universal
func getUniqueElements<T: Equatable>(elements: [T]) -> [T] {
    var elements = elements
    for _ in 0..<elements.count {
        let element = elements.removeFirst()
        if !elements.contains(where: { oneElement in
            element == oneElement
        }) {
            elements.append(element)
        }
    }
    return elements
}
getUniqueElements(elements: ["1", "2", "3", "1", "1", "1"])
getUniqueElements(elements: [1.2, 1.1, 1.2, 1.1, 1.3, 1.5])

// for structs
protocol ProductProtocol {
    var article: Int { get }
    var name: String { get }
    var description: String { get }
}
struct Product: ProductProtocol {
    var article: Int
    var name: String
    var description: String
}

protocol ShopProtocol {
    associatedtype T
    var products: [T] { get }
}
class Shop: ShopProtocol {
    
    typealias T = ProductProtocol
    var products: [T] = []
    
    init() {
        self.getData()
    }
    
    func getData() {
        
        let product1 = Product(article: 12345, name: "product1", description: "product1 description")
        let product2 = Product(article: 12345, name: "product2", description: "product2 description")
        let product3 = Product(article: 12345, name: "product3", description: "product3 description")
        let product4 = Product(article: 5, name: "product4", description: "product4 description")
        let product5 = Product(article: 5, name: "product5", description: "product5 description")
        
        self.products.append(contentsOf: [
            product1,
            product2,
            product3,
            product4,
            product5
        ])
    }
    
    func getUniqueProducts(products: [T]) -> [T] {
        var products = products
        for _ in 0..<products.count {
            let product = products.removeFirst()
            if !products.contains(where: { oneProduct in
                product.article == oneProduct.article
            }) {
                products.append(product)
            }
        }
        return products
    }
}

let shop = Shop()
shop.products
shop.getUniqueProducts(products: shop.products)
