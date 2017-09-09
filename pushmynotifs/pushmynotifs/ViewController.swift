//
//  ViewController.swift
//  pushmynotifs
//
//  Created by Daniel Ra on 8/26/17.
//  Copyright © 2017 Daniel Ra. All rights reserved.
//

import UIKit
import Firebaseimport; FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FIRMmessaging.messagin().subscribe(toTopic: "\topics\news")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

