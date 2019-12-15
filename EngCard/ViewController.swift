//
//  ViewController.swift
//  EngCard
//
//  Created by Applica on 15/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit
import FirebaseDatabase

var ref: DatabaseReference!
var countPalabras = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    func agregarPalabra(esp:String, eng:String){
        agregarEspañol(esp: esp)
        agregarIngles(eng: eng)
        countPalabras = countPalabras + 1
    }
    
    func agregarEspañol(esp:String){
        ref.child("p\(countPalabras)").child("esp").setValue(esp)
    }
    
    func agregarIngles(eng:String){
        ref.child("p\(countPalabras)").child("eng").setValue(eng)
    }

    @IBOutlet var engText: UITextField!
    @IBOutlet var espText: UITextField!
    
    @IBAction func guardar(_ sender: Any) {
        if (espText.text != nil && engText.text != nil){
        var espWord: String = espText.text!
        var engWord: String = engText.text!
        agregarPalabra(esp: espWord, eng: engWord)
        } else { print("error al guardar") }
    }
    
}

