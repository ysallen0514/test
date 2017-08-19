import UIKit

var skillInitIndexPathRow:String?

class skillVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UIPickerViewDelegate {
    
    @IBOutlet weak var UIBarbtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.showAlert()
        
    }
    @IBAction func nextStep(_ sender: Any) {
        if isUsed == false {
            wrongAlert(title: "錯誤", msg: "請選擇你得信用評級")
        }
    }
    
    var careerPointPicker =  UIPickerView()
    var careerPointModelPicker: CareerPointModelPicker?
    var normalPointPicker =  UIPickerView()
    var normalPointModelPicker: NormalPointModelPicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        
        for i in 1...84{
            appDelegate.page5.append(String(i))
        }
        
        
        UIBarbtn.layer.cornerRadius = 5
        UIBarbtn.layer.masksToBounds = true
        
        let skillsModelFile = Bundle.main.url(forResource: "skillsModel", withExtension: "json")
        let creditFile = Bundle.main.url(forResource: "credit", withExtension: "json")
        fileJson1(location: skillsModelFile!)
        fileJson2(location: creditFile!)
        
        navigationItem.title = "技能配點"
        tableView.register(skillCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(Points.self, forHeaderFooterViewReuseIdentifier: "headerFooterId")
        tableView.sectionHeaderHeight = 90
        tableView.delegate = self
        tableView.dataSource = self
        
        let button = createButton()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        tapGesture()
        createArraySkill()
        
        NotificationCenter.default.addObserver(self, selector: #selector(alert), name: .alert, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(skillsHeaderAlert), name: .skillsHeaderAlert, object: nil)
        
        creditLower = creditArray[0][whichCareer]
        creditUpper = creditArray[1][whichCareer]
    }
    
    func alert(){
        wrongAlert(title: "錯誤", msg: "請選擇一個數字")
    }
    override func hideKeyBoard() {
        super.hideKeyBoard()
        NotificationCenter.default.post(name: .tapFunc, object: self)
    }
    
    func fileJson1(location: URL) {
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        //let file = Bundle.main.url(forResource: "skillsModel", withExtension: "json")
        do{
            let data = try Data(contentsOf: location)
            let dataDic = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:AnyObject]
            for p in dataDic["skills"] as! [AnyObject] {
                skillsName.append(p["skill"] as! String)
                skillsInitValue.append(p["init_value"] as! String)
            }
            skillsInitValue[0] = appDelegate.page3[7]
            skillsInitValue[52] = String(Int(appDelegate.page3[2])!/2)
            
            print(skillsInitValue.count)
            
            for i in 0..<skillsInitValue.count { // 0 - 83 共84
                arraySkill[2].append(Int(skillsInitValue[i])!)
            }
            for j in 0..<arraySkill[2].count{
                    appDelegate.page5[j] = String(arraySkill[2][j])
                }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fileJson2(location: URL) {
        let application = UIApplication.shared
        let appDelegate = application.delegate as! AppDelegate
        //let file = Bundle.main.url(forResource: "skillsModel", withExtension: "json")
        do{
            let data = try Data(contentsOf: location)
            let dataDic = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) //as! [String:AnyObject]
            for p in dataDic as! [AnyObject] {
                creditArray[0].append(p["信用評級"] as! Int)
                creditArray[1].append(p["最大值"] as! Int )
                appDelegate.credit = String(creditArray[0][0])
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return skillsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? skillCell
        
        skillInitIndexPathRow = skillsInitValue[indexPath.row]
        
        myCell?.skillNameLabel.text = skillsName[indexPath.row]
        myCell?.skillInitLabel.text = skillsInitValue[indexPath.row]
        myCell?.careerPointText.text = "\(arraySkill[0][indexPath.row])"
        myCell?.normalPointText.text = "\(arraySkill[1][indexPath.row])"
        myCell?.createCareerPointPicker(Int((myCell?.normalPointText.text)!)!, Int(skillsInitValue[indexPath.row])!)
        
        myCell?.createNormalPointPicker(Int((myCell?.careerPointText.text)!)!, Int(skillsInitValue[indexPath.row])!)
        myCell?.skillRemarkLabel.text = careersRemarks[indexPath.row + 1]
        myCell?.totalPointsLabel.text = skillsInitValue[indexPath.row]
        // arraySkill[2][indexPath.row] = Int(skillsInitValue[indexPath.row])!
        myCell?.careerPointText.tag = indexPath.row
        myCell?.normalPointText.tag = indexPath.row
        
        myCell?.totalPointsLabel.tag = indexPath.row
        
        return myCell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let myHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerFooterId") as! Points
        
        myHeader.createCreditLevelPicker()
        
        myHeader.careerPointsLabel.text = "剩餘職業點： \(careerPoints)"
        myHeader.normalPointsLabel.text = "剩餘興趣點： \(normalPoints)"
        //myHeader.creditLevelTextField.text = "\(creditLower)"
        myHeader.remarkLabel.text = "備註：\(careersRemarks[0])"
        myHeader.initPointTitleLabel.text = "初始值"
        myHeader.careerPointTitleLabel.text = "職業點"
        myHeader.normalPointTitleLabel.text = "興趣點"
        myHeader.totalPointTitleLabel.text = "熟練度"
        return myHeader
    }
    
    func pointValue() -> Int {
        let selectedOne = normalPointPicker.selectedRow(inComponent: 0)
        let selected = normalPointModelPicker?.normalPointModelData[selectedOne]
        var selectedValue = 0
        if selected?.normalPoint != nil {
            selectedValue = Int((selected?.normalPoint)!)!
        }
        return selectedValue
    }
    
    func createPointsArray(_ Array:[String], pointArray: [String], _ indexPath: IndexPath) {
        var array = Array
        for i in 0...pointArray.count{
            array.append(pointArray[indexPath[i]])
        }
    }
    
    func createArraySkill() {
        for i in 0..<2 {
            for _ in 0..<84 {
                arraySkill[i].append(0)
            }
        }
    }
    
    func skillsHeaderAlert(){
        if i == 0 {
            wrongAlert(title: "錯誤", msg: "剩餘的職業點不足")
        }else if i == 1 {
            wrongAlert(title: "錯誤", msg: "剩餘的興趣點不足")
        }
    }
    
    override func wrongAlert(title: String, msg: String) {
        super.wrongAlert(title: title, msg: msg)
    }
}
