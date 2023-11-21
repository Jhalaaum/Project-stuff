import SwiftUI

struct AddItineraryView: View {
    
    @Binding var itineraries: [Itinerary]
    @State private var countryname = ""
    var alignToControl: Bool = false
    @State private var daysdefault = 10
    @State private var totalcostdefault = 10
    @State private var startdatedefault = Date()
    @State private var enddatedefault = Date()
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("Overall Info")
                .font(.largeTitle)
            Form {
                Section("General Info") {
                    VStack{
                        TextField("Enter a title (Example: Trip to India)", text: $countryname)
                    }
                }
                Section("Budget"){
                    HStack {
                        Text("Total budget:")
                        TextField("Enter budget", value: $totalcostdefault, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(minWidth: 15, maxWidth: 60)
                            .alignmentGuide(.controlAlignment) { $0[.leading] }
                        Stepper("Enter budget", value: $totalcostdefault, in: 1...1000000000000000000)
                            .labelsHidden()
                    }
                    .alignmentGuide(.leading) {
                        self.alignToControl
                        ? $0[.controlAlignment]
                        : $0[.leading]
                    }
                }
                Section("Dates"){
                    VStack{
                        DatePicker("Start:", selection: $startdatedefault)
                        DatePicker("End:", selection: $enddatedefault)
                        HStack {
                            Text("Number of days")
                            TextField("Enter days", value: $daysdefault, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(minWidth: 15, maxWidth: 60)
                                .alignmentGuide(.controlAlignment) { $0[.leading] }
                            Stepper("Number of days:", value: $daysdefault, in: 1...1000000000000000000)
                                .labelsHidden()
                        }
                        .alignmentGuide(.leading) {
                            self.alignToControl
                            ? $0[.controlAlignment]
                            : $0[.leading]
                        }
                        
                    }
                }
                Section {
                        Button("Save", role: .none) {
                            let newitinerary = Itinerary(country: countryname, startdate: startdatedefault, iscompleted: false, enddate: enddatedefault, days: daysdefault, totalcost: totalcostdefault)
                            print("hello world")
                            print(newitinerary)
                            itineraries.append(newitinerary)
                            dismiss()
                        }
                        Button("Cancel", role: .destructive) {
                            dismiss()
                    }
                }
            }
        }
    }
}
extension HorizontalAlignment {
    private enum ControlAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[HorizontalAlignment.center]
        }
    }
    static let controlAlignment = HorizontalAlignment(ControlAlignment.self)
}


