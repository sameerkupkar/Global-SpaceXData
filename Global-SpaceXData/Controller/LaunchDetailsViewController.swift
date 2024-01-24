//
//  LaunchDetailsViewController.swift
//  Global-SpaceXData
//
//  Created by Sameer Kupkar on 24/01/24.
//

import UIKit
import AlamofireImage
import Alamofire

class LaunchDetailsViewController: UIViewController {

    @IBOutlet weak var imgLaunch: UIImageView!
    @IBOutlet weak var LblLaunchName: UILabel!
    @IBOutlet weak var lblLaunchDetails: UILabel!
    
    
    var spaceSummaryDetails: SummaryModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SetUpDetails()
    }
    
    func SetUpDetails() {
        
        let imageURL = spaceSummaryDetails?.links?.mission_patch ?? ""
        AF.request(imageURL).responseImage { response in
            if let image = response.value {
                self.imgLaunch?.image = image
            }
        }
        

        LblLaunchName.text = spaceSummaryDetails?.mission_name
        lblLaunchDetails.text = spaceSummaryDetails?.details
    }
    
    
    @IBAction func openWiki(_ sender: Any) {
        
        let customURL = URL(string:spaceSummaryDetails?.links?.wikipedia ?? "")
        
        if UIApplication.shared.canOpenURL(customURL!) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL!)
            } else {
                UIApplication.shared.openURL(customURL!)
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
        
}
