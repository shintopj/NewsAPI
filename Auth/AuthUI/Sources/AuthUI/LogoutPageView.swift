import SwiftUI
import AuthPresenter

public struct LogoutPageView: View {
    @ObservedObject var store: LoginStore
    
//    var callback: (() -> Void)
    
    public init(store: LoginStore/*, callback: @escaping (() -> Void)*/) {
        self.store = store
//        self.callback = callback
    }
    
    public var body: some View {
        
        VStack {
            Text(" Welcome \(store.name)")
            
            Button("Logout") {
                store.logout()
//                callback()
            }
        }
        .padding()
    }
}

struct LogoutPageView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutPageView(store: LoginStore())
    }
}
