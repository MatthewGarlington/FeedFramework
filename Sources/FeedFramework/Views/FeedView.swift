import SwiftUI
import ComposableArchitecture

public struct FeedPostView: View {
    @EnvironmentObject var stackCardViewModel: StackCardViewModel
    @Namespace var namespace
    
    public let store: Store<FeedState, FeedAction>
    
    public init(store: Store<FeedState, FeedAction>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<FeedState, FeedAction>) in
            VStack {
                if viewStore.state.showProfile {
                    HStack(alignment: .center) {
                        ProfilePic(circleSize: 90, imageSize: 140)
                        ProfileNameBoard()
                        Spacer()
                    }
                    
                    Spacer()
                    ProfileInfoBarView()
                    ProfileDescription()
                        .padding()
                    VStack(spacing: 20) {
                        FollowersHeader()
                    }
                    StackCardView(store: store, post: Post(name: "Matthew Garlington", post: "This is post one ofijreiogjosdjfgoijdoigjsodfgjoisdjfgofidsjgsoid", profilePic: ""))
                        .frame(width: 400, height: 375)
                        .environmentObject(stackCardViewModel)
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .padding()
                } else {
                    VStack {
                        Spacer()
                        StackCardView(store: store, post: Post(name: "Matthew Garlington", post: "This is post one ofijreiogjosdjfgoijdoigjsodfgjoisdjfgofidsjgsoid", profilePic: ""))
                            .frame(width: 400, height: 375)
                            .environmentObject(stackCardViewModel)
                            .matchedGeometryEffect(id: "Card", in: namespace)
                            .padding()
                        Spacer()
                    }
                }
            }
        }
    }
}

public struct FeedPostView_Previews: PreviewProvider {
    public static var mockStore = Store(
        initialState: FeedState(),
        reducer: feedReducer,
        environment: .cancelRequest
    )
    public static var previews: some View {
        FeedPostView(store: mockStore)
            .environmentObject(StackCardViewModel())
            .preferredColorScheme(.dark)
    }
}
