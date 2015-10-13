import Foundation

import UIKit

typealias ServiceResponse = (NSDictionary?, NSError?) -> Void



class ClassServicioManager: NSObject{
    
    private var opcion = 0
    
    var delegate: ProtocoloServicioViewController?
    
    var respuesta = ClassRespuestaSWBO()
    override init(){
        
    }
    
    
    func consultarUrl(opcion: Int, controller: UIViewController, protocoloRecibido: ProtocoloServicioViewController){
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