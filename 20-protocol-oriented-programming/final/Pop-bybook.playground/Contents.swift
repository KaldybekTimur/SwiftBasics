import Foundation

protocol TeamRecord {
  var wins: Int { get }
  var losses: Int { get }
  var winningPercentage: Double { get }
}

extension TeamRecord{
    var gamesPlayed: Int {
        wins + losses
    }
}

struct BaseballRecord: TeamRecord {
  var wins: Int
  var losses: Int
  var winningPercentage: Double {
    Double(wins) / Double(wins + losses)
  }
}

let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed // 15

// MARK: - Default implementations

struct BasketballRecord: TeamRecord {
  var wins: Int
  var losses: Int
  let seasonLength = 82
}

extension TeamRecord {
 var winningPercentage: Double {
    (Double(wins) / Double(wins + losses))
 }
}
let minneapolisFunctors = BasketballRecord(wins: 60, losses: 22)
minneapolisFunctors.winningPercentage

struct HockeyRecord: TeamRecord {
  var wins: Int
  var losses: Int
  var ties: Int
  // Hockey record introduces ties, and has
  // its own implementation of winningPercentage
  var winningPercentage: Double {
    Double(wins) / Double(wins + losses + ties)
  }
}


let chicagoOptionals = BasketballRecord(wins: 10, losses: 6)
let phoenixStridables = HockeyRecord(wins: 8, losses: 7, ties: 1)
chicagoOptionals.winningPercentage // 10 / (10 + 6) == 0.625
phoenixStridables.winningPercentage // 8 / (8 + 7 + 1) == 0.5



protocol WinLoss {
  var wins: Int { get }
  var losses: Int { get }
}

extension WinLoss {
 var winningPercentage: Double {
   Double(wins) / Double(wins + losses)
    }
}

struct CricketRecord: WinLoss {
     var wins: Int
     var losses: Int
     var draws: Int
    var winningPercentage: Double {
       Double(wins) / Double(wins + losses + draws)
     }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples
miamiTuples.winningPercentage // 0.5
winLoss.winningPercentage // 0.53

/* Даже если miamiTuples и winLoss содержат один и тот же экземпляр, вы видите разные результаты. Это связано с тем, что статическая диспетчеризация выбирает реализацию на основе типа констант: CricketRecord для miamiTuples и WinLoss для winLoss.*/

// MARK: - Protocol Oriented benefit

/*
 *Programming to Interfaces, not Implementations*
 Сосредоточившись на протоколах, а не на их реализациях, вы можете применять контракты кода к любому типу - даже к тем, которые не поддерживают наследование. Предположим, вы должны реализовать TeamRecord в качестве базового класса.
 
 С протоколами вам не нужно беспокоиться о конкретном типе или даже о том, является ли объект классом или структурой; все, что вас волнует, - это наличие определенных общих свойств и методов.
 

 
 Говоря о поддержке одноразовых функций, таких как выигрыш или проигрыш по разделению, одно из реальных преимуществ протоколов состоит в том, что они допускают форму множественного наследования.
 При создании шрифта вы можете использовать протоколы, чтобы украсить его всеми необходимыми уникальными характеристиками:
 
 */
// MARK: -  *Traits, mixins and multiple inheritance*

protocol TieableRecord {
  var ties: Int { get }
}
protocol DivisionalRecord {
  var divisionalWins: Int { get }
  var divisionalLosses: Int { get }
}
protocol ScoreableRecord {
  var totalPoints: Int { get }
}
extension ScoreableRecord where Self: TieableRecord, Self: TeamRecord {
  var totalPoints: Int {
    (2 * wins) + (1 * ties)
  }
}
struct NewHockeyRecord: TeamRecord, TieableRecord, DivisionalRecord, CustomStringConvertible, Equatable {
  var wins: Int
  var losses: Int
  var ties: Int
  var divisionalWins: Int
  var divisionalLosses: Int
  var description: String {
    "\(wins) - \(losses) - \(ties)" }
}

/*
 Thanks to many protocol extensions with generic constraints, you can split() an Array or find the index(of:) an element, assuming the type of that element conforms to Equatable.
 These implementations are all defined within protocol extensions in the Swift standard library. By implementing them in protocol extensions, these behaviors can be treated as mix-ins, and do not need to be explicitly reimplemented on each adopting type.

 
 Расширения протокола позволяют писать код реализации для протоколов и даже писать реализации по умолчанию для методов, требуемых протоколом.
 • Расширения протокола являются основным драйвером для программирования, ориентированного на протокол, и позволяют писать код, который будет работать с любым типом, который соответствует протоколу.
 • Типовые ограничения для расширений протокола обеспечивают дополнительный контекст и позволяют писать более специализированные реализации.
 • Вы можете украсить тип характеристиками и миксинами, чтобы расширить поведение, не требуя наследования.
 • При правильном использовании протоколы способствуют повторному использованию и инкапсуляции кода.
 
 */






protocol A{
    var a: Int { get }
    var b: Int { get }
    func test()
}


struct a : A{
    
    var a: Int
    var b: Int
    
    func test() {
        print("test")
    }
}

extension A {
    var testB: Int{
        a + b
    }
}

var c = a(a: 2, b: 2)

c.testB

