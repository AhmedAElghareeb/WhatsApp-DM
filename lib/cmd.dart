// for build apk
// => flutter build apk --release

// for build app bundle
// => flutter build appbundle

// for extract release-key.jks
// => keytool -genkey -v -keystore $env:USERPROFILE\upload-keystore.jks
//         -storetype JKS -keyalg RSA -keysize 2048 -validity 10000
//         -alias upload
