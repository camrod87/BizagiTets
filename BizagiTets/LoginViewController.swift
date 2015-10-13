
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldUsuario: UITextField!
    
    @IBOutlet weak var textFieldContrasena: UITextField!
    
    private var usuario = "UsuarioBizagi"
    private var contrasena = "Bizagi1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        asignarDelegados()
       
    }
    
    func asignarDelegados(){
        textFieldUsuario.delegate = self
        textFieldContrasena.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func escuchadorInresar(sender: UIButton) {
        validarCredenciales()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func validarCredenciales(){
        
        if validarUsuario() == false{
            return
        }
        if validarContrasena() == false{
            return
        }
        
        self.performSegueWithIdentifier("segueListadoTareas", sender: nil)
        
    }
    func validarUsuario() -> Bool{
        if textFieldUsuario.text?.isEmpty == true{
            presentarDialogoFaltanDatos("FALTAN DATOS", mensaje: "Debes digitar un usuario")
            return false
        }else if textFieldUsuario.text! != usuario{
            presentarDialogoFaltanDatos("ERROR", mensaje: "El usuario ingresado no es correcto")
            return false
        }
        return true
    }
    
    func validarContrasena() -> Bool{
        if textFieldContrasena.text?.isEmpty == true{
            presentarDialogoFaltanDatos("FALTAN DATOS", mensaje: "Debes digitar una contraseña")
            return false
        }else if textFieldContrasena.text! != contrasena{
            presentarDialogoFaltanDatos("ERROR", mensaje: "La contraseña ingresada no es correcta")
            return false
        }
        return true
    }
    
    func presentarDialogoFaltanDatos(titulo: String, mensaje:String){
        let alertController = UIAlertController(title: titulo, message: mensaje, preferredStyle: .Alert)
        
        
        let OKAction = UIAlertAction(title: "Aceptar", style: .Default) { (action) in
            
        }
        alertController.addAction(OKAction)
        
        
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
