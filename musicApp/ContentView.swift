import SwiftUI

struct ContentView: View {
  @State var musicCellNum = 0
  
  var body: some View {
    ZStack(alignment: .top) {
      //      // 画像タイトルアーティスト
      VStack(spacing: 10) {
        // 画像の代わり
        Rectangle()
          .frame(
            width: UIScreen.main.bounds.width / 2.2,
            height: UIScreen.main.bounds.width / 2.2
        )
          .foregroundColor(.red)
        
        // タイトル
        Text(data[musicCellNum].title)
          .font(.title)
        
        // アーティスト
        Text("FKJ")
          .font(.caption)
        
        Spacer()
      }
      .padding(.top, 100)
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
          Spacer(minLength: 370)
          
          ZStack(alignment: .top) {
            VStack(spacing: 0) {
              ForEach(0..<data.count) {cell in
                Button(action: {
                  self.musicCellNum = cell
                }) {
                  Cell(cellData: data[cell])
                }
              }
            }
            .padding(.top, 60)
            .background(Color.black.opacity(0.5))
            
            
            
            GeometryReader{geo in
              Button(action: {print(1)}) {
                if (geo.frame(in: .global).minY > 50) {
                  Text("PLAY")
                    .font(.body)
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(
                      width: geo.frame(in: .global).minY > 50
                        ? geo.frame(in: .global).minY <= 200
                          ? geo.frame(in: .global).minY
                          : 200
                        : 50,
                      height: 50
                  )
                    .background(
                      LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.orange]),
                        startPoint: .leading,
                        endPoint: .trailing
                      )
                  )
                    .clipShape(Capsule())
                } else {
                  Image(systemName: "play.fill")
                    .foregroundColor(Color.white)
                    .frame(
                      width: 50,
                      height: 50
                  )
                    .background(
                      LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.orange]),
                        startPoint: .leading,
                        endPoint: .trailing
                      )
                  )
                    .clipShape(Capsule())
                }
              }
              .position(x: geo.size.width / 2, y: geo.size.height / 2)
              .offset(y: geo.frame(in: .global).minY < 50 ? -geo.frame(in: .global).minY + 50 : 0)
            }
            .frame(height: 50)
            .padding(.bottom)
          }
        }
      }
      
      HStack(spacing: 0) {
        Image(systemName: "chevron.left")
          .resizable()
          .frame(width: 8, height: 15)
        
        Spacer()
        Image(systemName: "ellipsis")
          .resizable()
          .frame(width: 15, height: 3)
      }
      .padding(.top, 40)
      .padding(.horizontal)
    }
    .frame(
      width: UIScreen.main.bounds.width,
      height: UIScreen.main.bounds.height
    )
      .background(
        LinearGradient(
          gradient: Gradient(colors: [Color.gray.opacity(0.6), Color.black.opacity(0.0)]),
          startPoint: UnitPoint(x: 1.0, y: 0),
          endPoint: UnitPoint(x: 1.0, y: 1.0)
        )
          .edgesIgnoringSafeArea(.all)
    )
  }
}

struct Cell: View {
  let cellData: Music
  
  var body: some View {
    HStack(spacing: 0) {
      Image(systemName: "play.circle.fill")
        .resizable()
        .frame(width: 20, height: 20)
        .padding(.trailing)
      
      Text("\(cellData.id)")
        .padding(.trailing, 5)
      
      Text("\(cellData.title)")
        .fixedSize(horizontal: false, vertical: true)
        .lineLimit(nil)
      
      Spacer()
      Image(systemName: "ellipsis")
        .resizable()
        .frame(width: 15, height: 3)
        .padding(.leading)
    }
    .foregroundColor(Color.white)
      .padding(.horizontal, 10)
      .padding(.bottom, 30)
  }
}

struct Music: Identifiable {
  var id: Int
  var title: String
}

var data = [
  Music(id: 1, title: "aaaaaaaaaaaaaaaaaaaaaa"),
  Music(id: 2, title: "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"),
  Music(id: 3, title: "あktごゔぁ"),
  Music(id: 4, title: "aaaaaaaaaaaa"),
  Music(id: 5, title: "間間間間間間間間間間間間間間間間間間間間"),
  Music(id: 6, title: "aaaaaa"),
  Music(id: 7, title: "aaaaaa"),
  Music(id: 8, title: "aaaaaa feat アカウン　0000"),
  Music(id: 9, title: "aaaaaaaaaaaaaaaaaaaaaa"),
  Music(id: 10, title: "aaaaaaaaaaaaaaaaaaaaaa"),
  Music(id: 11, title: "aaaaaaaaaaaaaaaaaaaaaa"),
  Music(id: 12, title: "aaaaaaaaaaaaaaaaaaaaaa"),
  Music(id: 13, title: "aaaaaaaaaaaaaaaaaaaaaa")
]
