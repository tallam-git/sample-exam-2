//
//  ProfileVC.swift
//  sample-exam-2
//
//  Created by Charan Tallam on 11/13/23.
//

import UIKit

class ProfileVC: UIViewController {

    var s1 : Student = Student(fullName: "", transferCredits: 0, startYear: 0, startMonth: 0)
    var isGradOrUnderGrad = -1
    
    @IBOutlet weak var fullNameLBL: UILabel!
    @IBOutlet weak var profileIV: UIImageView!
    @IBOutlet weak var transferCreditsLBL: UILabel!
    @IBOutlet weak var earliestGradLBL: UILabel!
    @IBOutlet weak var latestGradLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcCredits()
        // Do any additional setup after loading the view.
        self.fullNameLBL.text = self.s1.fullName
        self.transferCreditsLBL.text = "\(self.s1.transferCredits)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func calcCredits(){
        
        if(self.isGradOrUnderGrad == 0)
        {
            let outStandingCredits = UtilityConstants.underGradTotal - self.s1.transferCredits
            let early = ceil(outStandingCredits/UtilityConstants.underGradMax)
            self.earliestGradLBL.text = "\(early)"
            let late = ceil(outStandingCredits/UtilityConstants.underGradMin)
            self.latestGradLBL.text = "\(late)"
        }
        else{
            let outStandingCredits = UtilityConstants.gradTotal - self.s1.transferCredits
            let early = ceil(outStandingCredits/UtilityConstants.gradMax)
            self.earliestGradLBL.text = "\(early)"
            let late = ceil(outStandingCredits/UtilityConstants.gradMin)
            self.latestGradLBL.text = "\(late)"
        }
    }

}
