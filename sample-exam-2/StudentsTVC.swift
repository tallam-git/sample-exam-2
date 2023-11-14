//
//  StudentsTVC.swift
//  sample-exam-2
//
//  Created by Charan Tallam on 11/13/23.
//

import UIKit

class StudentsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var s : Student = Student(fullName: "", transferCredits: 0, startYear: 0, startMonth: 0)
    var flag: Int = -1
    
    @IBOutlet weak var studentsTV: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return underGrads.count
        }
        else
        {
            return Grads.count
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0)
        {
            return "Under Grad"
        }
        else{
            return "Grad"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if(section == 0)
        {
            let cell = self.studentsTV.dequeueReusableCell(withIdentifier: "undergrad", for: indexPath) as! StudentCell
            cell.titleLBL?.text = underGrads[indexPath.row].fullName
            cell.subTitileLBL?.text = "Started: \(underGrads[indexPath.row].startMonth)/\(underGrads[indexPath.row].startYear)\tTransfer Credits: \(underGrads[indexPath.row].transferCredits)"
            return cell
        }
        else
        {
            let cell = self.studentsTV.dequeueReusableCell(withIdentifier: "grad", for: indexPath) as! StudentCell
            cell.titleLBL?.text = Grads[indexPath.row].fullName
            cell.subTitileLBL?.text = "Started: \(Grads[indexPath.row].startMonth)/\(Grads[indexPath.row].startYear)\tTransfer Credits: \(Grads[indexPath.row].transferCredits)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = indexPath.section
        if (section == 0)
        {
            self.s = underGrads[indexPath.row]
            self.flag = 0
        }
        else
        {
        
            self.s = Grads[indexPath.row]
            self.flag = 1
        }
        
        performSegue(withIdentifier: "displayProfile", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.studentsTV.dataSource = self
        self.studentsTV.delegate = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, !identifier.isEmpty, identifier == "displayProfile"
        else {
            return
        }
        let destVC = segue.destination as! ProfileVC
        destVC.s1 = self.s
        destVC.isGradOrUnderGrad = flag
    }

}
