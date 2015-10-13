import Foundation

import UIKit

typealias ServiceResponse = (NSDictionary?, NSError?) -> Void



class ClassServicioManager: NSObject{
    
    static let instanciaCompartida = ClassServicioManager()
    
    private var opcion = 0
    
    var delegate: ProtocoloServicioViewController?
    
    var respuesta = ClassRespuestaSWBO()
    override init(){
        
    }
    
    
    func consultarUrl(params: Dictionary<String,String>?, opcion: Int, controller: UIViewController, protocoloRecibido: ProtocoloServicioViewController){
        self.opcion = opcion
        
        switch(self.opcion){
        case ClassConstantes.CONSULTAR_TAREAS:
            let urlCadena = ClassConstantes.DIRECCION_SERVIDOR+ClassConstantes.URL_CONSULTAR_TAREAS
            get(urlCadena, controller: controller, protocolo: protocoloRecibido)
            break
            
        case ClassConstantes.ENVIAR_RESULTADOS:
            let urlCadena = ClassConstantes.DIRECCION_SERVIDOR+ClassConstantes.URL_ENVIAR_RESULTADOS
            get(urlCadena, controller: controller, protocolo: protocoloRecibido)
            break
            
        default:
            break
        }
    }
    
    var utilidades = ClassUtilidades()
    
    
    private func get(url : String, controller: UIViewController, protocolo: ProtocoloServicioViewController) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        let session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        delegate = protocolo
        utilidades.iniciarProgreso(controller)
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            
            //print("Response: \(response)")
            
            if data == nil{
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.respuesta.setViewController(controller)
                    self.respuesta.setResultado("Acabó la tarea")
                    self.respuesta.setDatos(nil)
                    self.respuesta.setCaso(self.opcion)
                    self.respuesta.setServicioWebCorrecto(false)
                    self.delegate!.servicioWebConsumido(self.respuesta)
                    self.utilidades.detenerProgreso()
                })
                return
            }
            var cadena = ClassUtilidades().simulaDatosJSON()
            //let data2 = cadena.dataUsingEncoding(NSUTF8StringEncoding)
            
            var err: ErrorType? = nil
            //var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            var json: NSDictionary?
            do{
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? NSDictionary
            }catch{
                err = error
                print(error)
                self.respuesta.setServicioWebCorrecto(false) // TODO Este realmente no deberia estar acá pero es para que no se quede atascado
                
            }
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                //print(err!.localizedDescription)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    let success = parseJSON["success"] as? Int
                    
                    
                    
                    print("Succes: \(success)")
                    self.respuesta.setServicioWebCorrecto(true)
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    print("Error could not parse JSON: \(jsonStr)")
                    self.respuesta.setServicioWebCorrecto(false)
                }
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.respuesta.setViewController(controller)
                self.respuesta.setResultado("OK")
                self.respuesta.setDatos(cadena)
                self.respuesta.setCaso(self.opcion)
                self.respuesta.setServicioWebCorrecto(true)
                self.delegate!.servicioWebConsumido(self.respuesta)
                self.utilidades.detenerProgreso()
                
            })
            
            
        })
        
        task.resume()
        
    }
    
}