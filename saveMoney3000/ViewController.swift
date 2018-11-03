//
//  ViewController.swift
//  saveMoney3000
//
//  Created by Fulvio Fanelli on 16/07/2018.
//  Copyright © 2018 ac3000. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBOutlet weak var precoAlcool: UITextField!
    
    @IBOutlet weak var precoGasolina: UITextField!
    
    @IBOutlet weak var formulaComb: UIImageView!
    
    @IBOutlet weak var formulaComb2: UIImageView!
    
    @IBAction func calculoCombustivel(_ sender: Any) {
        
        if let precoAl = precoAlcool.text {
            if let precoGas = precoGasolina.text {
                if self.validarCampos(precoAlcool: precoAl, precoGasolina: precoGas) {
                    calcularMelhorCombustivel(precoAl: precoAl, precoGas: precoGas)
                }
                else {
                    labelResultado.text = "Número inválido";
                    formulaComb.alpha = 0.2;
                    formulaComb2.alpha = 0.4;
                }
            }
            else {
                labelResultado.text = "Preço da gasolina inválido";
                formulaComb.alpha = 0.2;
                formulaComb2.alpha = 0.4;
            }
        }
        else {
            labelResultado.text = "Preço do álcool inválido";
            formulaComb.alpha = 0.2;
            formulaComb2.alpha = 0.4;
        }
        
        view.endEditing(true);
    }
    
    func calcularMelhorCombustivel (precoAl: String, precoGas: String) {
        
        if let precoA = Double(precoAl.replacingOccurrences(of: ",", with: ".")) {
            if let precoG = Double(precoGas.replacingOccurrences(of: ",", with: ".")) {
                if (precoA / precoG) < 0.71 {
                    labelResultado.text = "É melhor utilizar álcool!";
                    formulaComb.alpha = 1;
                    formulaComb2.alpha = 0.4;
                }
                else {
                    labelResultado.text = "É melhor utilizar gasolina!";
                    formulaComb.alpha = 0.2;
                    formulaComb2.alpha = 1;
                }
            }
            else{
                labelResultado.text = "Erro na conversão";
                formulaComb.alpha = 0.2;
                formulaComb2.alpha = 0.4;
            }
        }
        else {
            labelResultado.text = "Erro na conversão";
            formulaComb.alpha = 0.2;
            formulaComb2.alpha = 0.4;
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var validacao = true;
        
        if precoAlcool.isEmpty || precoGasolina.isEmpty {
            validacao = false;
        }
        
        return validacao;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

