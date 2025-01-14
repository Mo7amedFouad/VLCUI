import Combine
import Foundation
import VLCUI

class ContentViewModel: ObservableObject {

    @Published
    var ticks: Int = 0
    @Published
    var playerState: VLCVideoPlayer.State = .opening
    @Published
    var position: Float = 0
    @Published
    var totalTicks: Int = 0

    let proxy: VLCVideoPlayer.Proxy = .init()

    var configuration: VLCVideoPlayer.Configuration {
        let configuration = VLCVideoPlayer
            .Configuration(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
        configuration.autoPlay = true
        return configuration
    }

    var positiveTimeLabel: String {
        (ticks.roundDownNearestThousand / 1000).timeLabel
    }

    var negativeTimeLabel: String {
        ((totalTicks.roundDownNearestThousand - ticks.roundDownNearestThousand) / 1000).timeLabel
    }

    func setCustomPosition(_ newPosition: Float) {
        position = newPosition
    }
}
