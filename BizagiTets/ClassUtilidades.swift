 //
//  ClassUtilidades.swift
//  BizagiTets
//
//  Created by Camilo Rodriguez on 10/12/15.
//  Copyright © 2015 Camilo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class ClassUtilidades{
    var indicator: UIActivityIndicatorView
    
    init(){
        indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    }
    
    var alert: UIAlertView = UIAlertView(title: "", message: "Por favor, espera un momento, estamos procesando la información...", delegate: nil, cancelButtonTitle: "");
    
    
    func iniciarProgreso(viewController: UIViewController){
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
        loadingIndicator.center = viewController.view.center;
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
        
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        alert.show();
        //alert.dismissWithClickedButtonIndex(-1, animated: true)
    }
    
    func detenerProgreso(){
        alert.dismissWithClickedButtonIndex(-1, animated: true)
    }
    
    func simulaDatosJSON() -> Dictionary<String, AnyObject>{
        let params1 =  ["processId": "1","process": "Vacations","activityId": "1","activity": "Approval","requestDate": "2013-03-01","employee": "Andres Iniesta","beginDate": "2013-12-23","endDate": "2014-01-03","lastVacationOn": "2013-01-03","approved": ""]
        let params2 =  ["processId": "1","process": "Vacations","activityId": "2","activity": "Approval","requestDate": "2013-01-17","employee": "Xavi Hernandez","beginDate": "2013-12-23","endDate": "2013-12-24","lastVacationOn": "2012-06-01","approved": ""]
        let params3 =  ["processId": "1","process": "Vacations","activityId": "3","activity": "Approval","requestDate": "2013-03-02","employee": "Sergio Busquets","beginDate": "2013-12-23","endDate": "2013-12-26","lastVacationOn": "2012-07-01","approved": ""]
        let params4 =  ["processId": "1","process": "Vacations","activityId": "4","activity": "Approval","requestDate": "2013-02-25",
            "employee": "Carles Puyol","beginDate": "2013-12-23","endDate": "2013-12-27","lastVacationOn": "2012-08-01","approved": ""]
        let params5 =  ["processId": "1","process": "Vacations","activityId": "5","activity": "Approval","requestDate": "2013-02-28","employee": "Francesc Fabregas","beginDate": "2013-12-23","endDate": "2014-01-02","lastVacationOn": "2012-09-01","approved": ""]
        let jsonObject: [String: AnyObject] = [
            "proceso": 1,
            "jugadores": [params1,params2,params3,params4,params5]
        ]
        
        let valid = NSJSONSerialization.isValidJSONObject(jsonObject) // true
        
        return jsonObject
    }
    
    
}