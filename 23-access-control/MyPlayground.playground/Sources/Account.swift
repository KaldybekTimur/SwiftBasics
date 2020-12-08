import Foundation

protocol Account {
  associatedtype Currency
  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}

public typealias Dollars = Double

/// A U.S. Dollar based "basic" account.
open class BasicAccount: Account {
   public private(set) var balance: Dollars = 0.0 ///Добавив private (set), свойство стало недоступным для потребителя.
  public func deposit(amount: Dollars) {
    balance += amount
  }
    public init() { }
 public func withdraw(amount: Dollars) {
    if amount <= balance {
        balance -= amount
    } else {
        balance = 0
        }
    }
}
