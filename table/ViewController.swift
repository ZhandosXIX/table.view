import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var GoLocation: UIButton!
    
    var name = ""
    var country = ""
    var imagename = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Выполните любые дополнительные настройки после загрузки представления.
        
        labelName.text = name
        labelCountry.text = country
        imageview.image = UIImage(named: imagename)
        
        GoLocation.addTarget(self, action: #selector(goToLocation), for: .touchUpInside)
          }
          
          @objc func goToLocation() {
              let mapVC = storyboard?.instantiateViewController(withIdentifier: "mapVC") as! MapViewController
              navigationController?.show(mapVC, sender: self)
          }
      }
       

 
