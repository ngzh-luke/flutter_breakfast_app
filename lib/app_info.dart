// app info config file
// to show on the app
// don't forget to update `pubspec.yaml` to match with the below settings
class AppInfo {
  late String appName;
  late String packageName;
  late String version;
  late String buildNumber;

  AppInfo(
      {this.appName = "Unknown",
      this.packageName = "Unknown",
      this.version = "0.0",
      this.buildNumber = "Unknown"});
  String getVersion() => version;

  String getAppName() => appName;
}

final info = AppInfo(version: "0.1"); // config here





// String pathToYaml = join(dirname(Platform.script.toFilePath()), 'pubspec.yaml');
// final pubspec = File(pathToYaml).readAsStringSync();
// final parsed = Pubspec.parse(pubspec);
// final ver = parsed.version;
// final ver = '1.0.0';


