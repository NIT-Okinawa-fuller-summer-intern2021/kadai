//
//  ViewController.swift
//  Okashi
//
//  Created by fuller on 2021/09/10.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate, SFSafariViewControllerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return okashiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "okashiCell", for: indexPath)
        
//        cell.textLabel?.text = okashiList[indexPath.row].name
        
        guard let imageData = try? Data(contentsOf: okashiList[indexPath.row].image) else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomOkashiTableViewCell") as? CustomOkashiTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(image: UIImage(data: imageData)!, name: okashiList[indexPath.row].name)
        
//        if let imageData = try? Data(contentsOf: okashiList[indexPath.row].image){
//            cell.imageView?.image = UIImage(data: imageData)
//        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let  safariViewController = SFSafariViewController(url: okashiList[indexPath.row].link)
        
        safariViewController.delegate = self
        
        present(safariViewController, animated: true)
        
    }
    

    @IBOutlet weak var searchOkashiBar: UISearchBar!
    @IBOutlet weak var okashiTableView: UITableView!
    
    var okashiList : [(name:String , maker:String , link:URL , image:URL)] = []
    
    struct ItemJson: Codable {
        let  name: String?
        let maker: String?
        let url: URL?
        let image: URL?
    }
    
    struct ResultJson: Codable {
        let item:[ItemJson]?
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        okashiTableView.register(UINib(nibName: "CustomOkashiTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomOkashiTableViewCell")
        
        searchOkashiBar.delegate = self
        searchOkashiBar.placeholder = "お菓子の名前を入力してください"
        
        okashiTableView.dataSource = self
        okashiTableView.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        guard let searchWord = searchBar.text else{ return }
        print(searchWord)
        searchOkashi(keyword: searchWord)
        
        }
    
    func searchOkashi(keyword : String){
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else{
            return
        }
        
        print(req_url)
        
        let req = URLRequest(url: req_url)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: req, completionHandler: {
            (data , response , error) in
            
            session.finishTasksAndInvalidate()
            do{
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self, from: data!)
                print(json)
                
                if let items = json.item{
                    self.okashiList.removeAll()
                    for item in items{
                        if let name = item.name , let maker = item.maker , let link = item.url , let image = item.image{
                            let okashi = (name, maker, link, image)
                            self.okashiList.append(okashi)
                        }
                    }
                    
                    self.okashiTableView.reloadData()
                    
                    if let okashidbg = self.okashiList.first {
                        print("----------------")
                        print("okashiList[0] = \(okashidbg)")
                    }
                }
                
                
            }catch {
                print("エラーが出ました")
            }
        })
        task.resume()
    }
}
    




