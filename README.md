# AppleFeedback-SwiftUITextFieldBinding
Note: it seems this has been fixed as of at least iOS 13.2 beta 1.

Project demonstrating an issue with TextField views in SwiftUI on Xcode 11 beta 5 with Catalina beta 5. This has been submitted as FB6926006

Description:

When pressing return to confirm the text in SwiftUI `TextField` with an initial value, the `TextField` clears unexpectedly. Thereafter, the app occasionally crashes with the error:

```
2019-08-04 13:10:26.361378-0700 AppleFeedback-SwiftUITextFieldBinding[6431:614384] Fatal error: Duplicate keys of type 'AnyHashable' were found in a Dictionary.
This usually means either that the type violates Hashable's requirements, or
that members of such a dictionary were mutated after insertion.
```

Steps to reproduce:

1. Clone the git repo at https://github.com/noahsark769/AppleFeedback-SwiftUITextFieldBinding
2. Open the xcodeproj
3. Run the project on an iOS 13 simulator (iPhone XR)
4. Tap on the TextField to start editing it
5. Press enter to end editing on the text field

Expected:

Nothing happens, the TextField keeps its initial value.

Actual:

The text clears unexpectedly. Additionally, if you keep selecting the text field and typing "Hello" into it (and pressing enter after to confirm), sometimes the text will update correctly, and sometimes the TextField will clear unexpectedly. I've found that if you do this enough, the app will crash with the error:

```
2019-08-04 13:10:26.361378-0700 AppleFeedback-SwiftUITextFieldBinding[6431:614384] Fatal error: Duplicate keys of type 'AnyHashable' were found in a Dictionary.
This usually means either that the type violates Hashable's requirements, or
that members of such a dictionary were mutated after insertion.
```
