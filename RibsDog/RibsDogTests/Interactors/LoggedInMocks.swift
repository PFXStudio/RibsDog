import RIBs
import RxSwift
@testable import RibsDog

struct LoggedInMocks {
    class LoggedInListenerMock: LoggedInListener {
        
    }
    
    class LoggedInRouterMock: Router<LoggedInInteractable>, LoggedInRouting {
        func cleanupViews() {
            
        }
        
        func routeToTicTacToe() {
            
        }
        
        func routeToOffGame(with games: [Game]) {
            
        }
    }
}
