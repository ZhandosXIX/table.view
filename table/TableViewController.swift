//
//  TableViewController.swift
//  table
//
//  Created by zhandos on 08.10.2023.
//

import UIKit

class TableViewController: UITableViewController {

//    var arrayName = ["Barcelona","Arsenal","PSG",]
//    var arrayCountry = ["Spain","England","France"]
//    var arrayImage = ["bar","ars","psg"]
    
    var arrayPersons = [person(name: "Barcelona", country: "Spain" , imagename: "bar"),
                        person(name: "Arsenal", country: "England" , imagename: "ars"),
                        person(name: "PSG", country: "France" , imagename: "psg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func addPerson(_ sender: Any) {
//        arrayName.append("new name")
//        arrayCountry.append("new country")
//        arrayImage.append("bar")
        
        arrayPersons.append(person(name:"new club" , country: "unknown", imagename: "bar"))
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1)as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelCountry = cell.viewWithTag(2)as! UILabel
        labelCountry.text = arrayPersons[indexPath.row].country
        
        let imageview = cell.viewWithTag(3) as! UIImageView
        imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "info")as!ViewController
        navigationController?.show(detailVC, sender: self)
        
        detailVC.name = arrayPersons[indexPath.row].name
        detailVC.country = arrayPersons[indexPath.row].country
        detailVC.imagename = arrayPersons[indexPath.row].imagename
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            arrayPersons.remove(at: indexPath.row)

            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
