import UIKit

/// two sum question- algoExpert
/// 1. decleare the function with arry and target
/// 2. loop through the array
/// 3. asigne the first element to a variable
/// 4. second loop for the seond value ( i + 1)
/// 5. with if condition check if the first and second number equals to the target then return the array
///


func twoSum(array: [Int], target: Int)-> [Int] {
    for i in 0..<arr.count - 1 {
        let firstNum = arr[i]
        for j in i + 1..<arr.count {
            let seconNum = arr[j]
            
            if firstNum + seconNum == t {
                return [firstNum, seconNum]
            }
        }
    }
    return []
}

/// 1. using hashmap
/// 2. define a variable with keys and value (Int and Bool) in  a dictionary
/// 3. loop through the array (Inheinced for loop)
/// 4. potential match will be to (targetSum - number in the array)
/// 5. add value to the hashmap (Dictionary)
/// 6. check if the number excist in the dictionary otherwise added to the dictionary
///
func twoSum2(array: [Int], target: Int) -> [Int] {
    var numbersHashMap = [Int: Bool]()
    for number in array {
        let match = target - number
        
        if let exists = numbersHashMap[match], exists {
            return [match, number]
        }else {
            numbersHashMap[number] = true
        }
    }
    return []
}

func twoSum3(array: [Int], target: Int) -> [Int] {
    array.sorted()
    var left = 0
    var right = array.count - 1
    
    while left < right {
        let currentSum = array[left] + array[right]
        if currentSum == target {
            return [array[left], array[right]]
        }else if currentSum < target {
            left += 1
        } else if currentSum > target {
            right -= 1
        }
    }
    return []
}



var arr = [3, 5, -4, 8, 11, 1, -1, 4]
let t = 14

let result = twoSum3(array: arr, target: t)
//print(result)

import Foundation
struct Articles: Decodable {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
}
struct Source: Decodable {
    let id: String
    let name: String
}

class APIService: NSObject {
    private let sourceURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=064b8b7c6e8b4be9a0f85453d2d4a119")
    
    func apiToGetNewsHeadlineData(completion: @escaping (Articles) ->()){
        URLSession.shared.dataTask(with: sourceURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let newsData = try! jsonDecoder.decode(Articles.self, from: data)
                completion(newsData)
            }
        }.resume()
    }
    
}
