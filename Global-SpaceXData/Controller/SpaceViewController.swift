//
//  SpaceViewController.swift
//  Global-SpaceXData
//
//  Created by Sameer Kupkar on 23/01/24.
//

import UIKit

class SpaceViewController: UIViewController {

    // MARK: - IBoutlets -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorLoader: UIActivityIndicatorView!
    // MARK: - Variable declarations -
    var spaceDataViewModel = SpaceDataViewModel()
    var spacesummaryArr = [SummaryModel]()
    
    // MARK: - View life cycle method -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        indicatorLoader.startAnimating()
        tableView.register(UINib(nibName: "SpaceSummaryTableViewCell", bundle: .main), forCellReuseIdentifier: "spaceSummaryTableViewCell")
        
        spaceDataViewModel.apiToGetSpaceData { [weak self] in
            self?.spacesummaryArr = self?.spaceDataViewModel.summaryModel ?? [SummaryModel]()

            DispatchQueue.main.async {
                self?.tableView.isHidden = false
                self?.indicatorLoader.stopAnimating()
                self?.tableView.reloadData()
            }
            
        }
        
    }
    
    /// Method to go to details controller
    /// - Parameter sender: Any
    @objc func actionGoToDetailsController(_ sender: UIButton) {
        
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LaunchDetailsViewController") as! LaunchDetailsViewController
//        popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        popOverVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//        popOverVC.spaceSummaryDetails = spacesummaryArr[sender.tag]
//        self.navigationController?.pushViewController(popOverVC, animated: true)
//
          let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "LaunchDetailsViewController") as! LaunchDetailsViewController
                 newViewcontroller.spaceSummaryDetails = spacesummaryArr[sender.tag]
                let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
                 
                self.present(newFrontController, animated: true, completion: nil)
    }
}


// Extension to handle delegate methods for table view
extension SpaceViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return spacesummaryArr.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        guard let cell = tableView.dequeueReusableCell(withIdentifier: "spaceSummaryTableViewCell") as? SpaceSummaryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(dataInstance: spacesummaryArr[indexPath.row])
        cell.btnViewDetails.tag = indexPath.row
        cell.btnViewDetails.addTarget(self, action: #selector(actionGoToDetailsController(_:)), for: .touchUpInside)
        return cell
        
    }

   
}
