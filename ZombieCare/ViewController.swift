//
//  ViewController.swift
//  ZombieCare
//
//  Created by Chris Baxter on 09/06/2016.
//  Copyright © 2016 Catalyst Mobile Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let service = newZCService(.Mock)
        
        let mockResource = MockResource(path: "careplan", method: "GET", headers: nil, parameters: nil)
       
        
        service.request(mockResource) { (response : CarePlan?, error) in
            
            if error == nil {
                
                print("\(response!.title) loaded.")
               
                
            }
        
            
            
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

