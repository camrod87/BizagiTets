//
//  ClassObtenerRespuestas.swift
//  BizagiTets
//
//  Created by OFICINA on 13/10/15.
//  Copyright © 2015 Camilo Rodriguez. All rights reserved.
//

import Foundation

class ClassObtenerRespuestas{
    func obtenerTareas(objetoJSON:NSDictionary?) -> Array<ClassUsuarioBO>?{
        var tareas = Array<ClassUsuarioBO>()
        let respuesta: NSArray? = objetoJSON!.valueForKey("jugadores") as? NSArray
        let total = respuesta!.count
        
        if total == 0{
            return nil
        }
        
        for contador in 0..<total {
            let tarea: NSDictionary = respuesta?[contador] as! NSDictionary
            let processId = tarea.valueForKey(ClassConstantes.JSON_PROCESS_ID) as? NSString
            let process = tarea.valueForKey(ClassConstantes.JSON_PROCESS) as? NSString
            let activityId = tarea.valueForKey(ClassConstantes.JSON_PROCESS_ACTIVITY_ID) as? NSString
            let activity = tarea.valueForKey(ClassConstantes.JSON_PROCESS_ACTIVITY) as? NSString
            let requestDate = tarea.valueForKey(ClassConstantes.JSON_PROCESS_REQUEST_DATE) as? NSString
            let employee = tarea.valueForKey(ClassConstantes.JSON_PROCESS_EMPLOYEE) as? NSString
            let beginDate = tarea.valueForKey(ClassConstantes.JSON_PROCESS_BEGIN_DATE) as? NSString
            let endDate = tarea.valueForKey(ClassConstantes.JSON_PROCESS_END_DATE) as? NSString
            let lastVacationOn = tarea.valueForKey(ClassConstantes.JSON_PROCESS_LAST_VACATION) as? NSString
            let approved = tarea.valueForKey(ClassConstantes.JSON_PROCESS_APPROVED) as? NSString
            
            let usuario = ClassUsuarioBO(processId: processId as! String, process: process as! String, activityId: activityId as! String, activity: activity as! String, requestDate: requestDate as! String, employee: employee as! String, beginDate: beginDate as! String, endDate: endDate as! String, lastVacationOn: lastVacationOn as! String, approved: approved as! String)
            
            tareas.append(usuario)
            
        }
        return tareas
    }
}