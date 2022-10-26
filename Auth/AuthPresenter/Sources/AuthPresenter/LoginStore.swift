import SwiftUI

public class LoginStore: ObservableObject {
    
    @Published public var user: User?
    
    public init(user: User? = nil) {
        self.user = user
    }
    
    public var name: String {
        return user?.name ?? "--"
    }
    
    public func login(name: String) {
        self.user = User(name: name)
//        self.objectWillChange.send()
    }
    
    public func logout() {
        self.user = nil
    }
}
