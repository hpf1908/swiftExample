//
//  TableViewController.swift
//  swiftTest
//
//  Created by pengfei huang on 14-6-25.
//  Copyright (c) 2014年 pengfei huang. All rights reserved.
//

import UIKit

let TestbasicOpetators       = "basicOpetators"
let TeststringsAndCharacters = "basicOpetators"
let Testcollections = "collctions"
let Testcontrols = "controls"
let Testfunctions = "functions"
let TestClosure = "Closure"
let TestEnumerations = "Enumerations"
let TestClassesAndStructures = "ClassesAndStructures"
let TestAssignmentAndCopy = "AssignmentAndCopy"
let TestProperty = "Property"
let TestMethod   = "Method"
let TestSubscript = "Subscript"
let TestInitialization = "Initialization"
let TestAutoRefreceCount = "AutoRefreceCount"

class TableViewController: UITableViewController {
    
    var tableArray:NSMutableArray = [
        TestbasicOpetators,
        TeststringsAndCharacters,
        Testcollections,
        Testcontrols,
        Testfunctions,
        TestClosure,
        TestEnumerations,
        TestClassesAndStructures,
        TestAssignmentAndCopy]
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!)  {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table View"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //#pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return tableArray.count;
    }
    
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true;
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if(editingStyle == UITableViewCellEditingStyle.Delete)
        {
            tableArray.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cellIdentifier:String = "cell";
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        
        if !cell {
            cell = UITableViewCell(style:.Default, reuseIdentifier: cellIdentifier)
        }
        cell.textLabel.text = tableArray.objectAtIndex(indexPath.row) as NSString
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        tableView.deselectRowAtIndexPath(indexPath,animated: true);
        var cellStr = tableArray[indexPath.row] as NSString
        
        switch cellStr {
        case TestbasicOpetators :
            self.testBasicOpetators();
        case TeststringsAndCharacters :
            self.testStringsAndCharacters();
        case Testcollections :
            self.testCollections();
        case Testcontrols :
            self.testControls();
        case Testfunctions :
            self.testFunctions();
        case Testclosure :
            self.testClosure();
        case TestEnumerations :
            self.testEnumerations();
        case ClassesAndStructures :
            self.testClassesAndStructures();
        case TestAssignmentAndCopy :
            self.testAssignmentAndCopy();
        case TestProperty:
            self.testProperty();
        case TestMethod:
            self.testMethod();
        case TestTestSubscript:
            self.testSubscript();
        case TestInitialization:
            self.testInitialization();
        case TestAutoRefreceCount:
            self.testAutoRefreceCount();
        default:
            self.showAlert(tableArray.objectAtIndex(indexPath.row) as NSString, rowToUseInAlert: indexPath.row)
            break;
        }
    }
    
    //#pragma mark - UIAlertView delegate methods
    
    func testBasicOpetators() {
        
        let b = 10
        var a = 5
        a = b
        
        if(a == b) {
            println(" \(a) is equal to \(b) ")
        }
        
        let dog: Character = "🐶"
        let cow: Character = "🐮"
        let dogCow = dog + cow
        println(" dogCow: \(dogCow) ")
        
        for index in 1...5 {
            println("\(index) times 5 is \(index * 5)")
        }
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..count {
            println("Person \(i + 1) is called \(names[i])")
        }
    }
    
    func testStringsAndCharacters() {
        
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        println("Interpolation: \(message) ");
        
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        if quotation == sameQuotation {
            println("These two strings are considered equal")
        }
        
        let dogString = "Dog!🐶"
        for codeUnit in dogString.utf16 {
            print("\(codeUnit) ")
        }
    }
    
    func testCollections() {
        
        self.testArray();
        self.testDictinary();
    }
    
    func testArray() {
        var shoppingList: String[] = ["Eggs", "Milk"]
        var shoppingListInfer = ["Eggs", "Milk"]
        
        shoppingListInfer += "Baking Powder"
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        
        var firstItem = shoppingList[0]
        shoppingList[0] = "Six eggs"
        
        for item in shoppingList {
            println(item)
        }
        
        var someInts = Int[]()
        println("someInts is of type Int[] with \(someInts.count) items.")
    }
    
    func testDictinary() {
        
        var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
        println("The dictionary of airports contains \(airports.count) items.")
        
        airports["LHR"] = "London"
        
        if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
            println("The old value for DUB was \(oldValue).")
        }
        
        for (airportCode, airportName) in airports {
            println("\(airportCode): \(airportName)")
        }
        
        var namesOfIntegers = Dictionary<Int, String>()
        namesOfIntegers[16] = "sixteen"
    }
    
    func testControls() {
        
        //switch
        let someCharacter: Character = "e"
        switch someCharacter {
        case "a", "e", "i", "o", "u":
            println("\(someCharacter) is a vowel")
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            println("\(someCharacter) is a consonant")
        default:
            println("\(someCharacter) is not a vowel or a consonant")
        }
        
        //value bindings
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            println("(0, 0) is at the origin")
        case (_, 0):
            println("(\(somePoint.0), 0) is on the x-axis")
        case (0, _):
            println("(0, \(somePoint.1)) is on the y-axis")
        case (-2...2, -2...2):
            println("(\(somePoint.0), \(somePoint.1)) is inside the box")
        default:
            println("(\(somePoint.0), \(somePoint.1)) is outside of the box")
        }
        
        //where的使用
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            println("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            println("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            println("(\(x), \(y)) is just some arbitrary point")
        }
        
        // prints "grtmndsthnklk"
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for character in puzzleInput {
            switch character {
            case "a", "e", "i", "o", "u", " ":
                continue
            default:
                puzzleOutput += character
            }
        }
        println(puzzleOutput)
        
        // prints "The number 5 is a prime number, and also an integer."
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 11, 13, 17, 19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        println(description)
        
        //Labeled Statements
        let finalSquare = 25
        var board = Int[](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        
        gameLoop: while square != finalSquare {
            if ++diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                // diceRoll will move us to the final square, so the game is over
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                // diceRoll will move us beyond the final square, so roll again
                continue gameLoop
            default:
                // this is a valid move, so find out its effect
                square += diceRoll
                square += board[square]
            }
        }
        println("Game over!")
    }
    
    func sayHelloAgain(personName: String) -> String {
        return "Hello again, " + personName + "!"
    }
    
    func halfOpenRangeLength(start: Int, end: Int) -> Int {
        return end - start
    }
    
    func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
        var vowels = 0, consonants = 0, others = 0
        for character in string {
            switch String(character).lowercaseString {
            case "a", "e", "i", "o", "u":
                ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
            "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
            default:
                ++others
            }
        }
        return (vowels, consonants, others)
    }
    
    //externalFunction
    func doSomething(externParam localParam: Int) {
    }
    
    //Shorthand External Parameter Names
    func containsCharacter(#string: String, characterToFind: Character) -> Bool {
        for character in string {
            if character == characterToFind {
                return true
            }
        }
        return false
    }
    
    func join(string s1: String, toString s2: String,
        withJoiner joiner: String = " ") -> String {
            return s1 + joiner + s2
    }
    
    func arithmeticMean(numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    func swapTwoInts(inout a: Int, inout b: Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
        println("Result: \(mathFunction(a, b))")
    }
    
    func testFunctions() {
        
        //normal function
        println(sayHelloAgain("flyhuang"));
        
        //mutil params
        println(halfOpenRangeLength(1, end:10));
        
        // prints "6 vowels and 13 consonants"
        let total = count("some arbitrary string!")
        println("\(total.vowels) vowels and \(total.consonants) consonants")
        
        //extern param
        doSomething(externParam: 10);
        
        let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
        
        //default values
        join(string: "hello", toString: "world", withJoiner: "-")
        
        //Variadic Parameters
        arithmeticMean(1, 2, 3, 4, 5)
        // returns 3.0, which is the arithmetic mean of these five numbers
        arithmeticMean(3, 8, 19)
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, b: &anotherInt)
        println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
        func addTwoInts(a: Int, b: Int) -> Int {
            return a + b
        }
        
        var mathFunction: (Int, Int) -> Int = addTwoInts
        println("Result: \(mathFunction(2, 3))")
        
        //function type as paramType
        printMathResult(addTwoInts, a: 3, b: 5);
        
        //function type as return type and nested functions
        func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
            func stepForward(input: Int) -> Int { return input + 1 }
            func stepBackward(input: Int) -> Int { return input - 1 }
            return backwards ? stepBackward : stepForward
        }
        var currentValue = -4
        let moveNearerToZero = chooseStepFunction(currentValue > 0)
        // moveNearerToZero now refers to the nested stepForward() function
        while currentValue != 0 {
            println("\(currentValue)... ")
            currentValue = moveNearerToZero(currentValue)
        }
        println("zero!")
    }
    
    func makeIncrementor(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    func testClosure() {
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversed = sort(names, { (s1: String, s2: String) -> Bool in
            return s1 > s2
            })
        //        var reversed = sort(names, { $0 > $1 } )
        //        var reversed = sort(names, >)
        println(names);
        
        //Trailing Closures
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map {
            (var number) -> String in
            var output = ""
            while number > 0 {
                output = digitNames[number % 10]! + output
                number /= 10
            }
            return output
        }
        // strings is inferred to be of type String[]
        // its value is ["OneSix", "FiveEight", "FiveOneZero"]
        println(strings);
        
        //Capturing Values
        let incrementByTen = makeIncrementor(forIncrement: 10)
        
        incrementByTen()
        // returns a value of 10
        incrementByTen()
        // returns a value of 20
        var incrementResult = incrementByTen()
        println("incrementResult \(incrementResult)");
    }
    
    enum Planet {
        case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
    }
    
    enum Barcode {
        case UPCA(Int, Int, Int)
        case QRCode(String)
    }
    
    var somePlanet = Planet.Earth
    //Associated Values
    var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
    
    func testEnumerations() {
        
        switch somePlanet {
        case .Earth:
            println("Mostly harmless")
        default:
            println("Not a safe place for humans")
        }
        
        switch productBarcode {
        case .UPCA(let numberSystem, let identifier, let check):
            println("UPC-A with value of \(numberSystem), \(identifier), \(check).")
        case .QRCode(let productCode):
            println("QR code with value of \(productCode).")
        }
    }
    
    func testClassesAndStructures() {
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        println("The width of someResolution is \(someResolution.width)")
        println("The width of someVideoMode is \(someVideoMode.resolution.width)")
    }
    
    func testAssignmentAndCopy() {
        
        var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
        var copiedAges = ages
        copiedAges["Peter"] = 24
        println(ages["Peter"])
        
        var a = [1, 2, 3]
        var b = a
        var c = a
        
        println(a[0])
        // 1
        println(b[0])
        // 1
        println(c[0])
        // 1
        
        a[0] = 42
        println(a[0])
        // 42
        println(b[0])
        // 42
        println(c[0])
        // 42
        
        a.append(4)
        a[0] = 777
        println(a[0])
        // 777
        println(b[0])
        // 42
        println(c[0])
        // 42
        
        b.unshare()
        
        b[0] = -105
        println(a[0])
        // 777
        println(b[0])
        // -105
        println(c[0])
        // 42
        
        if b === c {
            println("b and c still share the same array elements.")
        } else {
            println("b and c now refer to two independent sets of array elements.")
        }
    }
    
    func testProperty() {
        
        //lazy store
        let manager = DataManager()
        manager.data += "Some data"
        manager.data += "Some more data"
        
        println(manager.importer.fileName)
        // the DataImporter instance for the importer property has now been created
        // prints "data.txt"
        
        //getter setter
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
            size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // prints "square.origin is now at (10.0, 10.0)"
        
        //readonly
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        // prints "the volume of fourByFiveByTwo is 40.0"
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps
    }
    
    func testMethod() {
        
        let counter = Counter()
        // the initial counter value is 0
        counter.increment()
        // the counter's value is now 1
        counter.incrementBy(5)
        // the counter's value is now 6
        counter.reset()
        // the counter's value is now 0
        
        let counter2 = Counter()
        counter2.incrementBy(5, 3)
        
        let somePoint = Point(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOfX(1.0) {
            println("This point is to the right of the line where x == 1.0")
        }
        
        var somePoint1 = Point(x: 1.0, y: 1.0)
        somePoint1.moveByX(2.0, y: 3.0)
        println("The point is now at (\(somePoint1.x), \(somePoint1.y))")
        // prints "The point is now at (3.0, 4.0)"
        
        var player = Player(name: "Argyrios")
        player.completedLevel(1)
        println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // prints "highest unlocked level is now 2"
        
        var player2 = Player(name: "Beto")
        if player2.tracker.advanceToLevel(6) {
            println("player is now on level 6")
        } else {
            println("level 6 has not yet been unlocked")
        }
        // prints "level 6 has not yet been unlocked"
    }
    
    func testSubscript() {
        
        let threeTimesTable = TimesTable(multiplier: 3)
        println("six times three is \(threeTimesTable[6])")
        // prints "six times three is 18"
    }
    
    func testInitialization() {
        
        var breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6),
        ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            println(item.description)
        }
        // 1 x orange juice ✔
        // 1 x bacon ✘
        // 6 x eggs ✘
    }
    
    func testAutoRefreceCount() {
        
        var john: Person?
        var number73: Apartment?
        
        john = Person(name: "John Appleseed")
        number73 = Apartment(number: 73)
        
        john!.apartment = number73
        number73!.tenant = john
        
        john = nil
        
        var john1: Customer?
        john1 = Customer(name: "John Appleseed")
        john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        println(paragraph!.asHTML())
        // prints "<p>hello, world</p>"
    }
    
    func alertView(alertView: UIAlertView!, didDismissWithButtonIndex buttonIndex: Int) {
        NSLog("Did dismiss button: %d", buttonIndex)
    }
    
    // Function to init a UIAlertView and show it
    func showAlert(rowTitle:NSString, rowToUseInAlert: Int) {
        var alert = UIAlertView()
        
        alert.delegate = self
        alert.title = rowTitle
        alert.message = "You selected row \(rowToUseInAlert)"
        alert.addButtonWithTitle("OK")
        
        alert.show()
    }
}
