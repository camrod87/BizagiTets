//
//  TareasViewController.swift
//  BizagiTets
//
//  Created by Camilo Rodriguez on 10/12/15.
//  Copyright © 2015 Camilo Rodriguez. All rights reserved.
//

import UIKit

class TareasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProtocoloServicioViewController {
    
    var listadoTareas = Array<ClassUsuarioBO>()
    var listadoImagenes = Array<UIImageView>()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //simulaDescargaTareas()
        let servicioManager = ClassServicioManager()
        let delegado = self as ProtocoloServicioViewController
        servicioManager.consultarUrl(nil, opcion: ClassConstantes.CONSULTAR_TAREAS, controller: self, protocoloRecibido: delegado)
    }
    
    func simulaDescargaTareas(){
        let usuario1 = ClassUsuarioBO(processId: "1", process: "Vacations", activityId: "1", activity: "Approval", requestDate: "2013-03-01", employee: "Andres Iniesta", beginDate: "2013-12-23", endDate: "2014-01-03", lastVacationOn: "2013-01-03", approved: "")
        let usuario2 = ClassUsuarioBO(processId: "1", process: "Vacations", activityId: "1", activity: "Approval", requestDate: "2013-03-01", employee: "Xavi Hernandez", beginDate: "2013-12-23", endDate: "2014-01-03", lastVacationOn: "2013-01-03", approved: "")
        let usuario3 = ClassUsuarioBO(processId: "1", process: "Vacations", activityId: "1", activity: "Approval", requestDate: "2013-03-01", employee: "Sergio Busquets", beginDate: "2013-12-23", endDate: "2014-01-03", lastVacationOn: "2013-01-03", approved: "")
        let usuario4 = ClassUsuarioBO(processId: "1", process: "Vacations", activityId: "1", activity: "Approval", requestDate: "2013-03-01", employee: "Carles Puyol", beginDate: "2013-12-23", endDate: "2014-01-03", lastVacationOn: "2013-01-03", approved: "")
        let usuario5 = ClassUsuarioBO(processId: "1", process: "Vacations", activityId: "1", activity: "Approval", requestDate: "2013-03-01", employee: "Francesc Fabregas", beginDate: "2013-12-23", endDate: "2014-01-03", lastVacationOn: "2013-01-03", approved: "")
        listadoTareas.append(usuario1)
        listadoTareas.append(usuario2)
        listadoTareas.append(usuario3)
        listadoTareas.append(usuario4)
        listadoTareas.append(usuario5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*METODO SOBREESCRITO para que el table view conozca la cantidad de elementos a dibujar*/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listadoTareas.count // Cambiar por la cantidad de elementos a mostrar
    }
    
    /*METODO SOBREESCRITO para que el table view construya cada row en base a la informacion*/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("TareasTableViewCell", forIndexPath: indexPath) as! TareasTableViewCell
        celda.uiLabelRequester.text = "\(listadoTareas[indexPath.row].employee!)"
        celda.uiLabelDaysRequest.text = listadoTareas[indexPath.row].requestDate
        celda.uiLabelFromTo.text = "\(listadoTareas[indexPath.row].beginDate!) to \(listadoTareas[indexPath.row].endDate!)"
        listadoImagenes.append(celda.uiImageViewResponse)
        return celda
    }
    
    /*METODO SOBREESCRITO para escuchar un click de un elemento en el tableview*/
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("TAREA: \(indexPath.row)")
        let usuario = listadoTareas[indexPath.row]
        let mensaje = "Que deseas hacer con esta actividad? \n Actividad: \(usuario.activity!) \n Nombre: \(usuario.employee!) \n Desde - Hasta: \(usuario.beginDate) - \(usuario.endDate)"
        presentarDialogoConfirmacion("CONFIRMACIÓN", mensaje: mensaje, row: indexPath.row)
    }
    
    func servicioWebConsumido(respuestaBO: ClassRespuestaSWBO){
        let funcionoServicioWeb: Bool = respuestaBO.isServicioWebCorrecto()! as Bool
        if(funcionoServicioWeb){
            switch(respuestaBO.getCaso()!){
            case ClassConstantes.CONSULTAR_TAREAS:
                asignarTareas(respuestaBO.getDatos())
                break;
            default:
                break
            }
        }else{
        
        }
    }
    
    func asignarTareas(respuesta: NSDictionary?){
        self.listadoTareas = ClassObtenerRespuestas().obtenerTareas(respuesta)!
        self.tableView.reloadData()
    }
    
    func presentarDialogoConfirmacion(titulo: String, mensaje:String, row: Int){
        let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: .Alert)
        
        let aceptar = UIAlertAction(title: "Aceptar", style: .Cancel) { (action) in
            print("aceptar")
            var imagen = self.listadoImagenes[row]
            imagen.image = UIImage(named: "accepted")!
            
        }
        alertController.addAction(aceptar)
        
        let rechazar = UIAlertAction(title: "Rechazar", style: .Default) { (action) in
            print("rechazar")
            var imagen = self.listadoImagenes[row]
            imagen.image = UIImage(named: "rejected")!
        }
        alertController.addAction(rechazar)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .Default) { (action) in
            print("Cancelar")
            
        }
        alertController.addAction(cancelar)
        
        self.presentViewController(alertController, animated: true) {
            print("PresentViewController")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
