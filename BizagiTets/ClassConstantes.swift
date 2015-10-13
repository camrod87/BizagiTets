
import Foundation

class ClassConstantes{
    static let DIRECCION_SERVIDOR = "http://polls.apiblueprint.org"
    /*Urls de los servicios web*/
    static let URL_CONSULTAR_TAREAS = "/questions"
    static let URL_ENVIAR_RESULTADOS = "/enviar_resultados/"
    
    static let CONSULTAR_TAREAS: Int = 1
    static let ENVIAR_RESULTADOS: Int = 2
    
    /*Constantes para recuperar claves de objetos JSON*/
    static let JSON_PROCESS_ID = "processId"
    static let JSON_PROCESS = "process"
    static let JSON_PROCESS_ACTIVITY_ID = "activityId"
    static let JSON_PROCESS_ACTIVITY = "activity"
    static let JSON_PROCESS_REQUEST_DATE = "requestDate"
    static let JSON_PROCESS_EMPLOYEE = "employee"
    static let JSON_PROCESS_BEGIN_DATE = "beginDate"
    static let JSON_PROCESS_END_DATE = "endDate"
    static let JSON_PROCESS_LAST_VACATION = "lastVacationOn"
    static let JSON_PROCESS_APPROVED = "approved"
}