
import Foundation
import UIKit

class ClassRespuestaSWBO{
    
    private var seleccion: UIViewController?
    private var resultado: String?
    private var datos: NSDictionary?
    private var caso: Int?
    private var servicioWebCorrecto: Bool?
    
    
    func getViewController()-> UIViewController?{
        return self.seleccion
    }
    
    func setViewController(seleccion: UIViewController){
        self.seleccion = seleccion
    }
    
    func getResultado()-> String?{
        return self.resultado
    }
    
    func setResultado(resultado: String){
        self.resultado = resultado
    }
    
    func getDatos()-> NSDictionary?{
        return self.datos
    }
    
    func setDatos(datos: NSDictionary?){
        self.datos = datos
    }
    
    func getCaso()-> Int?{
        return self.caso
    }
    
    func setCaso(caso: Int){
        self.caso = caso
    }
    
    func isServicioWebCorrecto()-> Bool?{
        return self.servicioWebCorrecto
    }
    
    func setServicioWebCorrecto(valor: Bool){
        self.servicioWebCorrecto = valor
    }
}