import SwiftUI

struct FeedPostView: View {
    @EnvironmentObject var stackCardViewModel: StackCardViewModel
    @State private var longPressed: Bool = false
    @State private var show: Bool = false
    @State private var showComments: Bool = false
    @Namespace var namespace
    var body: some View {
        VStack {
            if show {
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
                StackCardView(post: Post(name: "Matthew Garlington", post: "This is post one ofijreiogjosdjfgoijdoigjsodfgjoisdjfgofidsjgsoid", profilePic: ""), longPressed: $longPressed, show: $show, showComment: true)
                    .frame(width: 400, height: 375)
                    .environmentObject(stackCardViewModel)
                    .matchedGeometryEffect(id: "Card", in: namespace)
                    .padding()
            } else {
            VStack {
            Spacer()
                StackCardView(post: Post(name: "Matthew Garlington", post: "This is post one ofijreiogjosdjfgoijdoigjsodfgjoisdjfgofidsjgsoid", profilePic: ""), longPressed: $longPressed, show: $show, showComment: true)
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

struct FeedPostView_Previews: PreviewProvider {
    static var previews: some View {
        FeedPostView()
            .environmentObject(StackCardViewModel())
            .preferredColorScheme(.dark)
    }
}
