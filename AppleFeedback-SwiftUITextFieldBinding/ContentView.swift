//
//  ContentView.swift
//  AppleFeedback-SwiftUITextFieldBinding
//
//  Created by Noah Gilmore on 8/4/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import SwiftUI
import Combine

final class Container: CustomDebugStringConvertible {
    let name: String

    init(name: String) {
        self.name = name
    }

    var speech: String {
        if self.name.count > 10 {
            return "My name is too long"
        } else {
            return "My name is \(self.name)"
        }
    }

    var debugDescription: String {
        return "<Container: \(self.name)>"
    }
}

class ContainerFormatter: Formatter {
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        print("Getting object value in formatter for \(string)")
        obj?.pointee = Container(name: string)
        return true
    }

    override func string(for obj: Any?) -> String? {
        print("Asking regular string for \(obj!)")
        guard let container = obj as? Container else { return nil }
        return container.name
    }

    override func editingString(for obj: Any) -> String? {
        print("Asking editing string for \(obj)")
        return self.string(for: obj)
    }

    override func attributedString(for obj: Any, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        print("Asking for attributed string")
        return nil
    }

    override func isPartialStringValid(_ partialString: String, newEditingString newString: AutoreleasingUnsafeMutablePointer<NSString?>?, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        print("Asking if partial string is valid")
        return true
    }

    override func isPartialStringValid(_ partialStringPtr: AutoreleasingUnsafeMutablePointer<NSString>, proposedSelectedRange proposedSelRangePtr: NSRangePointer?, originalString origString: String, originalSelectedRange origSelRange: NSRange, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        print("Asking if partial pointer is valid")
        return true
    }
}

struct ContainerView : View {
    @State var container = Container(name: "Initial")
    static let formatter = ContainerFormatter()

    var body: some View {
        VStack(alignment: .leading) {
            TextField(
                "Title",
                value: $container,
                formatter: Self.formatter,
                onEditingChanged: { _ in },
                onCommit: {}
            ).padding()
                .background(Color.green)
                .cornerRadius(5)
            Text(container.speech)
                .foregroundColor(.white)
                .font(.caption)
                .background(Color.red)
            Spacer()
        }.padding()
    }
}

#if DEBUG
struct ContainerView_Previews : PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
#endif
