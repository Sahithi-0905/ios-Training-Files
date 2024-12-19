//
//  BookTicketViewController.swift
//  TicketBookingProjectSahithi
//
//  Created by FCI on 11/12/24.
//

import UIKit
import SafariServices
import QuartzCore

class BookTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //ui eements
    @IBOutlet var tableView: UITableView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var webname: UILabel!
    @IBOutlet var webLink: UILabel!
    @IBOutlet var Nextbtn: UIButton!
    
    //tabel view elemens
    var flightNames: [String] = []
    var flightImages: [String] = []
    var flightURLs: [String] = []
    
    var trainNames: [String] = []
    var trainImages: [String] = []
    var trainURLs: [String] = []
    
    var busNames: [String] = []
    var busImages: [String] = []
    var busURLs: [String] = []
    
    var movieNames: [String] = []
    var movieImages: [String] = []
    var movieURLs: [String] = []
    
    var nxturl:String!
    var nxttitle:String!
    
    //core graphics variables
    var labelLayer : CALayer!
    var ButtonLayer : CALayer!
    var imagelayer : CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set core animation for ui elements
        labelLayer=webname.layer
        labelLayer.cornerRadius = 10
        
        labelLayer=webLink.layer
        labelLayer.cornerRadius = 10
        
        imagelayer=img.layer
        imagelayer.cornerRadius = 10
        
        ButtonLayer=img.layer
        ButtonLayer.cornerRadius = 10
        
        
        //assigning data to tabel view elemens
        flightNames = ["Make MY Trip","Indigo","Ixigo"]
        flightImages = ["mytrip.png","inddigo.png","ixi.png"]
        flightURLs = ["https://www.makemytrip.com","https://www.goindigo.in","https://www.ixigo.com"]
        
        
        trainNames = ["IRCTC","Confirm Ticket","Ixigo"]
        trainImages = ["irctc.jpeg","confirm.png","ixitrain.png"]
        trainURLs = ["https://www.irctc.co.in","https://www.confirmtkt.com","https://www.ixigo.com"]
        
        busNames = ["Red Bus","Abhi Bus","Paytm"]
        busImages = ["red.jpeg","abhi.png","paytm.png"]
        busURLs = ["https://www.redbus.in","https://www.abhibus.com","https://www.paytm.com"]
        
        movieNames = ["Book My Show","Paytm","Inox"]
        movieImages = ["book.jpeg","paytm.png","inox.jpeg"]
        movieURLs = ["https://www.redbus.in","https://www.abhibus.com","https://www.inoxmovies.com"]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    //function to add number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //function to add number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return flightNames.count
        }
        
        else if section == 1{
            return trainNames.count
        }
        else if section == 2{
            return busNames.count
        }
        else{
            return movieNames.count
        }
    }
    
    //create and display tabel view elements
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = flightNames[indexPath.row]
            cell1.textLabel?.textColor = UIColor.white
            cell1.accessoryType = .detailDisclosureButton
            
            return cell1
        }
        else if indexPath.section == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell2.textLabel?.text = trainNames[indexPath.row]
            cell2.textLabel?.textColor = UIColor.white
            cell2.accessoryType = .detailDisclosureButton
            return cell2
        }
        else if indexPath.section == 2{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell2.textLabel?.text = busNames[indexPath.row]
            cell2.textLabel?.textColor = UIColor.white
            cell2.accessoryType = .detailDisclosureButton
            return cell2
        }
        else{
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell3.textLabel?.text = movieNames[indexPath.row]
            cell3.textLabel?.textColor = UIColor.white
            cell3.accessoryType = .detailDisclosureButton
            return cell3
        }
    }
    //table footer titles
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            
            return "Flights End"
        }
        else if section == 1 {
            return "Train End"
        }
        else if section == 2{
            return "Bus End"
        }
        else{
            return "Movies End"
        }
    }
    
    //Header section titles
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            
            return "Flights"
        }
        else if section == 1{
            return "Train"
        }
        else if section == 2{
            return "Bus"
        }
        else{
            return "Movies End"
        }
    }
    /* functions to change heager and footer titles colour
    //footer text to white
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.textLabel?.textColor = UIColor.white
    }
    //header text to white
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.textLabel?.textColor = UIColor.white
    }*/
    
    //row click function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0{
            webname.text = flightNames[indexPath.row]
            webLink.text = flightURLs[indexPath.row]
            nxturl = flightURLs[indexPath.row]
            nxttitle = flightNames[indexPath.row]
            img.image = UIImage(named: flightImages[indexPath.row])
            
        }
        else if indexPath.section==1{
            webname.text = trainNames[indexPath.row]
            webLink.text = trainURLs[indexPath.row]
            nxturl = trainURLs[indexPath.row]
            nxttitle = trainNames[indexPath.row]
            img.image = UIImage(named: trainImages[indexPath.row])
            
        }
        else if indexPath.section==2{
            webname.text = busNames[indexPath.row]
            webLink.text = busURLs[indexPath.row]
            nxturl = busURLs[indexPath.row]
            nxttitle = busNames[indexPath.row]
            img.image = UIImage(named: busImages[indexPath.row])
            
        }
        else{
            webname.text = movieNames[indexPath.row]
            webLink.text = movieURLs[indexPath.row]
            nxturl = movieURLs[indexPath.row]
            nxttitle = movieNames[indexPath.row]
            img.image = UIImage(named: movieImages[indexPath.row])
        }
    }
    
    //function when user select any accessory button
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        if indexPath.section==0{
            webname.text = flightNames[indexPath.row]
            webLink.text = flightURLs[indexPath.row]
            nxturl = flightURLs[indexPath.row]
            nxttitle = flightNames[indexPath.row]
            img.image = UIImage(named: flightImages[indexPath.row])
            
            
        }
        else if indexPath.section==1{
            webname.text = trainNames[indexPath.row]
            webLink.text = trainURLs[indexPath.row]
            nxturl = trainURLs[indexPath.row]
            nxttitle = trainNames[indexPath.row]
            img.image = UIImage(named: trainImages[indexPath.row])
            
        }
        else if indexPath.section==2{
            webname.text = busNames[indexPath.row]
            webLink.text = busURLs[indexPath.row]
            nxturl = busURLs[indexPath.row]
            nxttitle = busNames[indexPath.row]
            img.image = UIImage(named: busImages[indexPath.row])
        }
        else{
            webname.text = movieNames[indexPath.row]
            webLink.text = movieURLs[indexPath.row]
            nxturl = movieURLs[indexPath.row]
            nxttitle = movieNames[indexPath.row]
            img.image = UIImage(named: movieImages[indexPath.row])
        }
    }
    
    //section titles
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        let indexTitles = ["Flights","Trains","Busses","MovieTickets"]
        return indexTitles
    }
    
    
    
    //function to select webview or safari
    @IBAction func nextbtn(){
        
        guard let url = nxturl else {
            displayAlerts(alertTitle: "Row not Selected", alertmessage: " ")
            return
        }
        
        let alert = UIAlertController(title: "Select Any  Option", message: "Please Select Any Web Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Safari", style: .default, handler:{ (_) in
            print("Safari Button Clicked")
            
            guard let urls = URL(string: self.webLink.text!)
            else{
                return
            }
            let safariVC = SFSafariViewController(url: urls)
            self.present(safariVC,animated: true, completion: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "WebView", style: .default, handler:{ (_) in
            print("WebView Button Clicked")
            
            let next1 = WebsiteViewController()
            next1.titles = self.nxttitle
           
            var web = String(describing:self.nxturl!)
            next1.weburl=web
            print(web,"in web")
            self.navigationController?.pushViewController(next1, animated: true)
          
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:{ (_) in
            print("Photo library Button Clicked")
            
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    //function to animate table view
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: 1.5, delay: 0.09 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            index += 1
        }
    }
    func displayAlerts(alertTitle: String, alertmessage: String) {
        // Display an alert with a title and message
        let alert = UIAlertController(title: alertTitle, message: alertmessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
}
