//
//  ViewController.swift
//  Json paring Link
//
//  Created by Abdul Ahad on 7/30/17.
//  Copyright © 2017 plash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load into Session
        let url = URL(string: "https://api.randomuser.me")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        //print(json)
                        
                        
                        let result = json["results"] as! [[String:Any]]
                        print("\(result)")
                        
                        let info = json["info"] as! [String:AnyObject]
                        
                     let gender =   result.first?["gender"] as! String
                        print("\(gender)")
                        
                        
                        
                     //   let gender = result["gender"] as! [[String:Any]]
                      //  print("\(gender)")
                        
                        let name =  result.first?["name"] as! [String:AnyObject]
                        
                        for item in name
                        {
                            print("\(item.key),,,,\(item.value)")
                        }
                        
                        let email = result.first?["email"] as! String
                        print("\(email)")
                        
                        
                        let login = result.first?["login"] as! [String:AnyObject]
                        
                        for item in login{
                            print("\(item.key),,\(item.value)")
                        }
                        
                        print("\(info)")
                       
                        for item in info{
                            print("\(item.key) ,,, \(item.value)")
                        }
                        
                    }
                    
                }
                catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
        
        
        
        
    }

   


}

