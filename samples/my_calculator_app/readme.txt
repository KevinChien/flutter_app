Under windows you need:

1. install Flutter SDK and add flutter\bin into environment variable like:
   C:\src\flutter\bin
2. install android studio
   a. open android studio
   b. File> settings>plugins
      i. search flutter and install, it will also install dart plugin in the same time.
   c. open AVD manager(android virtual device manager) and generate a emulator what you need.
3. open terminal type "flutter doctor" to check environment all ready.
   If not, please try to fix them.
   Most like you need to install visual studio or cmdline sdk not found, etc.


Q1. If your project doesn't have folder "android", you can execute below cmd to add:

$ flutter create .

Q2. I cannot find cmd "adb"
Find your android sdk, they may be under these path:
C:\Users\<YourUsername>\AppData\Local\Android\Sdk
C:\Android\Sdk
or you can find them under android studio in settings page flow.
When you find it, make system vairable:
variable name: ANDROID_HOME
variable value: C:\Users\<YourUsername>\AppData\Local\Android\Sdk

Then you go value path of environment variable to add below values:
%ANDROID_HOME%\emulator
%ANDROID_HOME%\tools
%ANDROID_HOME%\tools\bin
%ANDROID_HOME%\platform-tools

Now you can use cmd "adb devices" as normal.

Q3. How do I run test?
Go to project root and execute cmd "flutter test" in terminal

When cmd "flutter doctor" all pass and emulator is running(you can check via cmd "adb devices")
You can do:

# clear cache and generate files
$ flutter clean

# download and install all dependency in pubspec.yaml
$ flutter pub get

# build and run app
$ flutter run


P.S.
This project generate via chatgpt 3.5, license depend on chatgpt's rule.