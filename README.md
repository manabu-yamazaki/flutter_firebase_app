# flutter_firebase_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Firebase
https://console.firebase.google.com/u/0/project/fir-memo-app-f6afe/overview?hl=ja

# FlutterFire install
https://firebase.flutter.dev/
+ Firebase CLI

firebase login

# ビルドが遅い場合
ios/Podfile に以下を追加する
target 'Runner' do の中、flutter_install_all_ios_podsの前
'''
pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '10.0.0'
'''
+ 以下のコマンド
flutter clean
flutter pub get
flutter run

# デバッグ実行
F5キー

# ビルド(証明書が必要？)
flutter build apk
flutter build ios