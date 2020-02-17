//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var result: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		result.text = String(10)
    }


}

