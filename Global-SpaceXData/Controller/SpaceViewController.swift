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
    
    // MARK: - Variable declarations -
    var spaceDataViewModel = SpaceDataViewModel()
    var spacesummaryArr = [SummaryModel]()
    
    // MARK: - View life cycle method -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SpaceSummaryTableViewCell", bundle: .main), forCellReuseIdentifier: "spaceSummaryTableViewCell")
        
        spaceDataViewModel.apiToGetSpaceData { [weak self] in
            self?.spacesummaryArr = self?.spaceDataViewModel.summaryModel ?? [SummaryModel]()

            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
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
        return cell
        
    }

    private func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            cell.backgroundColor = .gray
      }
    }

    private func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
          cell.backgroundColor = .white
      }
    }
   
}
