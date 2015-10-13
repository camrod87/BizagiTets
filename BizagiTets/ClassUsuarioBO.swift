//
//  ClassUsuarioBO.swift
//  BizagiTets
//
//  Created by Camilo Rodriguez on 10/12/15.
//  Copyright © 2015 Camilo Rodriguez. All rights reserved.
//

import Foundation

class ClassUsuarioBO{
    var processId : String?
    var process: String?
    var activityId: String?
    var activity: String?
    var requestDate: String?
    var employee: String?
    var beginDate: String?
    var endDate: String?
    var lastVacationOn: String?
    var approved: String?
    
    init(processId: String?, process: String?, activityId: String?, activity: String?, requestDate: String?, employee: String?, beginDate: String?, endDate: String?, lastVacationOn: String?, approved: String?){
        self.processId = processId
        self.process = process
        self.activityId = activityId
        self.activity = activity
        self.requestDate = requestDate
        self.employee = employee
        self.beginDate = beginDate
        self.endDate = endDate
        self.lastVacationOn = lastVacationOn
        self.approved = approved
    }
}