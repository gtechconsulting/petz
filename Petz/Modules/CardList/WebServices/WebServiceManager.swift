//
//  WebServiceManager.swift
//  Petz
//
//  Created by Camilo Oscar Girardelli Baptista on 15/05/23.
//


import UIKit

class WebServiceManager: NSObject {
  
  static let sharedService = WebServiceManager()
  
  typealias WebServiceCompletionBlock = (_ data: [AnyObject]?,_ error: Error?)->Void
  
  enum HTTPMethodType: Int {
    case POST = 0
    case GET
  }
  
  func requestAPI(url: String,parameter: [String: AnyObject]?, httpMethodType: HTTPMethodType, completion: @escaping WebServiceCompletionBlock) {
    
    let escapedAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
    var request = URLRequest(url: URL(string: escapedAddress!)!)
      
    request.setValue("omgvamp-hearthstone-v1.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
    request.setValue("5ef0a1d651mshafafe2c640c6352p1d2324jsn3cc8ef5db366", forHTTPHeaderField: "X-RapidAPI-Key")
    
    switch httpMethodType {
    case .POST:
      request.httpMethod = "POST"
    case .GET:
      request.httpMethod = "GET"
      
      if parameter != nil{
        do {
          request.httpBody = try JSONSerialization.data(withJSONObject: parameter as Any, options: .prettyPrinted)
        } catch let error {
          print(error.localizedDescription)
        }
      }
      
      let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        guard let data = data, error == nil else {                                                                 return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
          print("Error in fetching response")
        }
        
        do {
          if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [AnyObject] {
            completion(json as [AnyObject],nil)
          }
        } catch let error {
          print(error.localizedDescription)
          completion(nil,error)
        }
        
      }
      task.resume()
      
    }
    
  }
  

}
