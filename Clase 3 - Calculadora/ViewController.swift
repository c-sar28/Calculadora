//
//  ViewController.swift
//  Clase 3 - Calculadora
//
//  Created by César Elías Segura on 14/4/18.
//  Copyright © 2018 César Elías Segura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Constantes
    let intCaractermaximo = 37
    //Variables
    var strParametro : String = ""
    var strResultado : String = "0"
    var boolOperacion : Bool = true
    var boolReiniciarResultado : Bool = true
    var intCaracterContador : Int8 = 0
    var intResultadoIntermedio : Int8 = 0
    var strOperadorTipo : String = ""
    var intParametro1: Int = 0
    var intParametro2: Int = 0
    var strParametro1 : String = ""
    
    //Elementos de interfaz
    @IBOutlet weak var lblParametro: UILabel!
    @IBOutlet weak var lblResultado: UILabel!
    
    //Funciones de inicializacion
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Funciones propias
    func limpiarResultado(){
        lblParametro.text = ""
        lblResultado.text = "0"
        strParametro = ""
        strResultado = "0"
        strParametro1 = ""
        intParametro1 = 0
        intParametro2 = 0
        intCaracterContador = 0
        intResultadoIntermedio = 0
        boolOperacion = true
        strOperadorTipo = ""
        }
    
    func contenarValoresNumericos(valor:String){
        if intCaracterContador <= intCaractermaximo {
            if boolReiniciarResultado{
                limpiarResultado()
                boolReiniciarResultado = false
                }
            strParametro = strParametro + valor
            strParametro1 = strParametro1 + valor
            lblParametro.text = strParametro
            boolOperacion = false
            intCaracterContador += 1
            }
    }
    
    func contenarValoresOperacion(valor:String){
        if intCaracterContador <= intCaractermaximo {
            strParametro = strParametro + valor
            lblParametro.text = strParametro
            intCaracterContador += 1
            intResultadoIntermedio += 1
            intResultadoIntermedio %= 2
            if intResultadoIntermedio == 0{
                ejecutarOperacion()
                strParametro1 = ""
                intResultadoIntermedio += 1
            }else{
                intParametro1 = Int(strParametro1)!
                strParametro1 = ""
                }
            strOperadorTipo = valor
            }
        }
    
    func ejecutarOperacion(){
        intParametro2 = Int(strParametro1)!
        switch strOperadorTipo {
            case "+" :  intParametro1 += intParametro2
            case "-" :  intParametro1 -= intParametro2
            case "/" :  intParametro1 /= intParametro2
            default:  intParametro1 *= intParametro2
            }
        lblResultado.text = String(intParametro1)
        boolOperacion = true
        }
    
    //Acciones
    @IBAction func btnIgual(_ sender: UIButton) {
        if !boolReiniciarResultado{
            ejecutarOperacion()
            boolReiniciarResultado = true
            }
    }
    
    @IBAction func btnLimpiarParametroResultado(_ sender: UIButton) {
        limpiarResultado()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        limpiarResultado()
    }
    
    @IBAction func btnSuma(_ sender: UIButton) {
        if !boolOperacion{
            contenarValoresOperacion(valor: "+")
            }
    }
    
    @IBAction func btnResta(_ sender: UIButton) {
        if !boolOperacion{
            contenarValoresOperacion(valor: "-")
            }
    }
    
    @IBAction func btnDivision(_ sender: UIButton) {
        if !boolOperacion{
            contenarValoresOperacion(valor: "/")
            }
    }
    
    @IBAction func btnMultiplicacion(_ sender: UIButton) {
        if !boolOperacion{
            contenarValoresOperacion(valor: "*")
            }
    }
    
    //Valores de numeros
    @IBAction func btnUno(_ sender: UIButton) {
        contenarValoresNumericos(valor: "1")
    }
    
    @IBAction func btnDos(_ sender: UIButton) {
        contenarValoresNumericos(valor: "2")
    }
    
    @IBAction func btnTres(_ sender: UIButton) {
        contenarValoresNumericos(valor: "3")
    }
    
    @IBAction func btnCuatro(_ sender: UIButton) {
        contenarValoresNumericos(valor: "4")
    }

    @IBAction func btnCinco(_ sender: UIButton) {
        contenarValoresNumericos(valor: "5")
    }
    
    @IBAction func btnSeis(_ sender: UIButton) {
        contenarValoresNumericos(valor: "6")
    }

    @IBAction func btnSiete(_ sender: UIButton) {
        contenarValoresNumericos(valor: "7")
    }
    
    @IBAction func btnOcho(_ sender: UIButton) {
        contenarValoresNumericos(valor: "8")
    }
    
    @IBAction func btnNueve(_ sender: UIButton) {
        contenarValoresNumericos(valor: "9")
    }
    
    @IBAction func btnCero(_ sender: UIButton) {
        if !strParametro1.isEmpty{
            contenarValoresNumericos(valor: "0")
            }
    }
    
}//Fin de clase

