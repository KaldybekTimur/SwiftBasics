import Foundation

///Codable - это протокол, которому может соответствовать тип, чтобы объявить, что он может быть закодирован и декодирован. По сути, это псевдоним для протоколов Encodable и Decodable.
typealias Codable = Encodable & Decodable

 struct Employee{
   var name: String
   var id: Int
   var favoriteToy: Toy?
    
    // By default, this enumeration is created by the compiler, but when you need to rename a key you need to implement it yourself.
    
   enum CodingKeys: String, CodingKey {
     case id = "employeeId"
     case name
     case gift
       }
     }

struct Toy: Codable{
    var name: String
}

let teddy = Toy(name: "TeddyBear")
let employee1 = Employee(name: "John", id: 7, favoriteToy: teddy)

// Приближается день рождения Джона, и вы хотите подарить ему его любимую игрушку. Эти данные необходимо отправить в отдел подарков. Прежде чем вы сможете это сделать, вам нужно его закодировать, например:

let jsonEncoder = JSONEncoder()
let jsonData = try jsonEncoder.encode(employee1)
print(jsonData)

//Если вы хотите создать читаемую версию этого JSON в виде строки, вы можете использовать инициализатор String:

if let jsonString = String(data: jsonData, encoding: .utf8){
   print(jsonString)
}
// Теперь вы можете отправить json Data или json String в отдел подарков, используя их специальный API для подарков.
// Если вы хотите декодировать данные JSON обратно в экземпляр, вам необходимо использовать JSONDecoder:

let jsonDecoder = JSONDecoder()
let employee2 = try jsonDecoder.decode(Employee.self, from:jsonData)


//the JSON should actually look like this:
/// { "employeeId": 7, "name": "John Appleseed", "gift": "Teddy Bear" }


// MARK: - The Encode function implementation

extension Employee: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(id, forKey: .id)
  ///  try container.encode(favoriteToy?.name, forKey: .gift) - для того чтобы приравнять к значению которое нужно: ("gift": "Teddy Bear")
    
    // MARK: - EncodeIfPresent and DecodeIfPresent
    // Оказывается, не у всех сотрудников есть любимая игрушка. В этом случае метод кодирования создаст JSON, который выглядит следующим образом:
    // {"name":"John Appleseed","gift":null,"employeeId":7}
    //you can use encodeIfPresent
    try container.encodeIfPresent(favoriteToy?.name,
    forKey: .gift)
    
  }
}


// MARK: - The Decode function implementation

///Здесь вы в значительной степени делаете противоположное тому, что вы делали в методе кодирования, используя контейнер хранения с ключом декодера.

extension Employee: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        id = try values.decode(Int.self, forKey: .id)
        if let gift = try values.decodeIfPresent(String.self, forKey: .gift){
        favoriteToy = Toy(name: gift)
    }
  }
}


