//
//  Extensions.swift
//  Koinz
//
//  Created by Salah  on 21/05/2022.
//

import Foundation

extension Array {

   func mapWithIndex<T> (f: (Int, Element) -> T) -> [T] {
     return zip((self.startIndex ..< self.endIndex), self).map(f)
   }
    
    func adding(_ element: Element, afterEvery n: Int) -> [Element] {
        guard n > 0 else { fatalError("afterEvery value must be greater than 0") }
        let newcount = self.count + self.count / n
        return (0 ..< newcount).map { (i: Int) -> Element in
            (i + 1) % (n + 1) == 0 ? element : self[i - i / (n + 1)]
        }
    }

 }