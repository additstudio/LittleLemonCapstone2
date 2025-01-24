import SwiftUI
import UIKit
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    
    func getMenuData () {
        
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let urlSession = URLSession.shared
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                let fullmenu = try! decoder.decode(MenuList.self, from: data)
                let menuItems = fullmenu.menu
                menuItems.forEach {
                        let newDish = Dish(context: viewContext)
                        newDish.title = $0.title
                        newDish.price = $0.price
                        newDish.image = $0.image
                   }
                try? viewContext.save()
            }
        }
        task.resume()
    }
    
    
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.2868252397, green: 0.3679389954, blue: 0.3397990167, alpha: 1)))
                VStack{
                    HStack{
                        VStack (alignment: .leading) {
                            Text("Little Lemon")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .foregroundColor(.llYellow)
                            Text("Chicago")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.llGray)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        
                        Image("heroImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width:180, height: 200, alignment: .trailing)
                            .cornerRadius(CGFloat(20))
                        
                    }
                    .padding(.bottom, 30)
                    TextField("Search menu...", text: $searchText)
                        .padding()
                        .font(.system(size: 18))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 1)))
                        .foregroundColor(.llGray)
                        .frame(width: 380, height: 40)
                }
            }
            .frame(height: 360, alignment: .topLeading)
            
            
            
            FetchedObjects(predicate: buildPredicate(searchText: searchText), sortDescriptors: buildSortDescriptors()) { (dishes:[Dish]) in
                List {
                    ForEach(dishes) { dish in
                        let imageURL = dish.image ?? ""
                        HStack {
                            VStack (alignment: .leading){
                                Text(dish.title ?? "")
                                    .font(.system(size: 18, weight: .bold))
                                    .multilineTextAlignment(TextAlignment.leading)
                                Text("$ \(dish.price ?? "")")
                                    .font(.system(size: 18))
                                    .multilineTextAlignment(TextAlignment.leading)
                            }
                            Spacer()
                            AsyncImage(url: URL(string: imageURL)!) {image in
                                image.image?
                                    .resizable()
                            }
                            .frame(width: 100, height: 100, alignment: .trailing)

                            
                        }
                    }
                }
                .searchable(text: $searchText, prompt: Text("Search menu.."))
                
                
                
            }
        }
        .onAppear(perform: getMenuData)
    }
    
    
    private func buildPredicate (searchText: String) -> NSPredicate {
        
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    private func buildSortDescriptors () -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
}

#Preview {
    Menu()
}
