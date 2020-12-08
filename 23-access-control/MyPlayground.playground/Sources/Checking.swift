import Foundation
/**
 private: доступен только для определяющего типа, все вложенные типы и расширения этого типа в одном исходном файле.
 • fileprivate: доступен из любого места в пределах исходного файла, в котором он определен.
 • internal: доступен из любого места в модуле, в котором он определен. Это уровень доступа по умолчанию.
 • public: доступен из любого места внутри модуля, в котором он определен, а также из другого программного модуля, импортирующего этот модуль.
 • open: то же, что и public, с дополнительной возможностью переопределения кодом в другом модуле.
 */

public class CheckingAccount: BasicAccount {
    private let accountNumber = UUID().uuidString
    
    private var issuedChecks: [Int] = []
    private var currentCheck = 1
    
   public class Check {
        let account: String
        var amount: Dollars
        private(set) var cashed = false
        
        func cash() { cashed = true }
        
        /*
         private entities can be accessed from anything within lexical scope, but in this case CheckingAccount is one step outside the scope of Check. Fortunately, this is where fileprivate is very useful.
         
         Модификатор fileprivate идеально подходит для «связного» кода в исходном файле; то есть код, который тесно связан или служит достаточно общей цели, чтобы иметь общий, но защищенный доступ. Check и CheckingAccount - это примеры двух связанных типов.
         */
    
      fileprivate init(amount: Dollars, from account: CheckingAccount) {
            self.amount = amount
            self.account = account.accountNumber
        }
    }
    public override init() { }
       public func writeCheck(amount: Dollars) -> Check? {
            guard balance > amount else {
            return nil
        }
        let check = Check(amount: amount, from: self)
        withdraw(amount: check.amount)
            return check
        }
       public func deposit(_ check: Check) {
            guard !check.cashed else {
            return
        }
        deposit(amount: check.amount)
           check.cash()
        }
}

/// A private extension implicitly marks all of its members as private.

private extension CheckingAccount {
    func inspectForFraud(with checkNumber: Int) -> Bool {
        issuedChecks.contains(checkNumber)
    }
    func nextNumber() -> Int {
        let next = currentCheck
        currentCheck += 1
        return next
    }
}
extension CheckingAccount: CustomStringConvertible {
  public var description: String {
    "Checking Balance: $\(balance)"
  }
}
