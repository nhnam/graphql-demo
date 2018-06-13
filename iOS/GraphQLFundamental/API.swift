//  This file was automatically generated and should not be edited.

import Apollo

public final class DemoQuery: GraphQLQuery {
  public static let operationString =
    "query Demo($name: String) {\n  xinChao(name: $name)\n}"

  public var name: String?

  public init(name: String? = nil) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("xinChao", arguments: ["name": GraphQLVariable("name")], type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(xinChao: String) {
      self.init(snapshot: ["__typename": "Query", "xinChao": xinChao])
    }

    public var xinChao: String {
      get {
        return snapshot["xinChao"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "xinChao")
      }
    }
  }
}