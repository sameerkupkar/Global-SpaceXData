//
//  SpaceSummaryTableViewCell.swift
//  Global-SpaceXData
//
//  Created by Sameer Kupkar on 24/01/24.
//

import UIKit
import AlamofireImage
import Alamofire

class SpaceSummaryTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var imgLaunch: UIImageView!
    @IBOutlet weak var lblMissonName: UILabel!
    @IBOutlet weak var lblLaunchSiteName: UILabel!
    @IBOutlet weak var lblLaunchDate: UILabel!
    @IBOutlet weak var lblRocketName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Method to configure cell
    /// - Parameter dataInstance: SummaryModel
    func configureCell(dataInstance: SummaryModel) {
        
//        if let url = NSURL(string: dataInstance.links?.mission_patch ?? ""),
//                let data = NSData(contentsOf: url as URL) {
//               imgLaunch.image = UIImage(data: data as Data)
//            }
        
        lblMissonName.text = dataInstance.mission_name
        lblLaunchSiteName.text = dataInstance.launch_site?.site_name
        lblRocketName.text = dataInstance.rocket?.rocket_name
        lblLaunchDate.text = "Date:" + convertDateFormatForSpace(inputDate: dataInstance.launch_date_local ?? "")
    
        let imageURL = dataInstance.links?.mission_patch ?? ""
        AF.request(imageURL).responseImage { response in
            if let image = response.value {
                self.imgLaunch?.image = image
            }
        }
    }
    
    public func convertDateFormatForSpace(inputDate : String) -> String {
        
        let inputdateFormatter = DateFormatter()
        inputdateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXX"
        inputdateFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let dateToChange = inputdateFormatter.date(from: inputDate) {
            
            inputdateFormatter.dateFormat = "dd MMM yyyy"
            
            return inputdateFormatter.string(from: dateToChange)
        }
        
        return "-"
    }
}
