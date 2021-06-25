//
//  Webservices.swift
//  Task
//
//  Created by Abhishek on 01/05/21.
//

import Foundation

class Webservice {
    
    
    static func getAllEmployeeData(urlString : String,completion: @escaping ([Employees]?) ->()) {
        
        guard let url = URL(string: urlString) else {
            
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let employees = try? JSONDecoder().decode([Employees].self, from: data)
            DispatchQueue.main.async {
                employees == nil ? completion(nil) : completion(employees)
            }
        }.resume()
        
    }
    
}
