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
	var res : Double = 0
	var currentNum = ""
	var cleared = true
	var signed = false
	var decimal = false
	var divide =  false
	var multiply = false
	var add = false
	var sub = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	func addDigit(i : Int) {
		if (i == 0 && result.text == "0") { return }
		cleared = false
		if currentNum ==  "0" {
			currentNum = String(i)
		} else {
			currentNum.append(String(i))
		}
		result.text = currentNum
	}
	
	func addDecimalPoint(){
		if !decimal {
			currentNum.append(".")
			decimal = true
			result.text = currentNum
		}
	}
	
	func apppendResult(){
		//only one bool will be true at any time or none
		if divide {
			res = res / (Double(currentNum) ?? 0)
			divide = false
		}
		else if multiply {
			res = res * (Double(currentNum) ?? 0)
			multiply = false
		}
		else if add {
			res = res + (Double(currentNum) ?? 0)
			add = false
		}
		else if sub {
			res = res - (Double(currentNum) ?? 0)
			sub = false
		} else {
			res = (Double(currentNum) ?? 0)
		}
		currentNum = "0"
		signed = false
		if (res - Double(Int(res)) == 0){
			result.text = String(Int(res))
		} else {
			result.text = String(res)
		}
	}
	
	func clearFlags(){
		divide = false
		multiply = false
		add = false
		sub = false
		signed = false
		decimal = false
	}

	@IBAction func ZeroPressed(_ sender: Any) {
		addDigit(i: 0)
	}
	
	@IBAction func OnePressed(_ sender: Any) {
		addDigit(i: 1)
	}
	
	@IBAction func TwoPressed(_ sender: Any) {
		addDigit(i: 2)
	}
	
	@IBAction func ThreePressed(_ sender: Any) {
		addDigit(i: 3)
	}
	
	@IBAction func FourPressed(_ sender: Any) {
		addDigit(i: 4)
	}
	
	@IBAction func FivePressed(_ sender: Any) {
		addDigit(i: 5)
	}
	
	@IBAction func SixPressed(_ sender: Any) {
		addDigit(i: 6)
	}
	
	@IBAction func SevenPressed(_ sender: Any) {
		addDigit(i: 7)
	}
	
	@IBAction func EightPressed(_ sender: Any) {
		addDigit(i: 8)
	}
	
	@IBAction func NinePressed(_ sender: Any) {
		addDigit(i: 9)
	}
	
	@IBAction func ClearPressed(_ sender: Any) {
		if cleared {
			cleared = false
			currentNum = "0"
			result.text = currentNum
		} else {
			res = 0
			clearFlags()
			currentNum = "0"
			result.text = currentNum
			
		}
	}
	
	@IBAction func PlusPressed(_ sender: Any) {
		if currentNum == "0"{
			clearFlags()
		} else {
			apppendResult()
		}
		add = true
		
	}
	
	
	@IBAction func MinusPressed(_ sender: Any) {
		if currentNum == "0"{
			clearFlags()
		} else {
			apppendResult()
		}
		sub = true
	}
	
	
	@IBAction func MultPressed(_ sender: Any) {
		if currentNum == "0"{
			clearFlags()
		} else {
			apppendResult()
		}
		multiply = true
	}
	
	
	@IBAction func DivPressed(_ sender: Any) {
		if currentNum == "0"{
			clearFlags()
		} else {
			apppendResult()
		}
		divide = true
	}
	
	
	@IBAction func EqualPressed(_ sender: Any) {
		apppendResult()
		if (res - Double(Int(res)) == 0){
			result.text = String(Int(res))
		} else {
			result.text = String(res)
		}
	}
	
	@IBAction func DotPressed(_ sender: Any) {
		addDecimalPoint()
	}
	
	
	@IBAction func PlusMinusPressed(_ sender: Any) {
		if signed {
			currentNum.remove(at: currentNum.startIndex)
		} else {
			currentNum = "-" + currentNum
		}
		result.text = currentNum
		signed = !signed
	}
}

