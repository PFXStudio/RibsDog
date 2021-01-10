import RIBs
import RxSwift
@testable import RibsDog

class LoggedInListenerMock: LoggedInListener {
    
}

class LoggedInRouterMock: Router<LoggedInInteractable>, LoggedInRouting {
    var setCleanupViewsCount = 0
    var setCleanupViewsHandler: (() -> Void)?
    func cleanupViews() {
        setCleanupViewsCount += 1
        setCleanupViewsHandler?()
    }
    
    var setRouteToTicTacToeCount = 0
    var setRouteToTicTacToeHandler: (() -> Void)?
    func routeToTicTacToe() {
        setRouteToTicTacToeCount += 1
        setRouteToTicTacToeHandler?()
    }
    
    var setRouteToOffGameCount = 0
    var setRouteToOffGameHandler: (([Game]) -> Void)?
    func routeToOffGame(with games: [Game]) {
        setRouteToOffGameCount += 1
        setRouteToOffGameHandler?(games)
    }
}
