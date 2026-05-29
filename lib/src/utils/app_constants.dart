import 'package:portfolio/src/models/experience_item.dart';
import 'package:portfolio/src/models/menu_item.dart';
import 'package:portfolio/src/models/my_work.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/services/date_service.dart';
import 'package:portfolio/src/utils/app_assets.dart';

class AppConstants {
  static const String name = "Dhanush Rajamohan";
  static const String about = "About";
  static const String experience = "Experience";
  static const String myWorks = "My Works";
  static const String skills = "Skills";
  static const String contact = "Contact";
  static const String menu = "Menu";
  static DateTime startDate = DateTime(2018, 5);
  static String aboutMessage =
      "Hi, I am $name a seasoned professional with over ${DateService().getExperienceYears().years} years ${DateService().getExperienceYears().months} months of experience in the software industry. My expertise spans both frontend development and middleware development, making me proficient in crafting engaging user interfaces while seamlessly integrating them with robust backend systems";
  static const String copyright = "© Copyright ";
  static const String builtMessage = "Built with ❤️ by $name";
  static const String mobileNumber = "9578268884";
  static const String emailId = "dhanush623@gmail.com";
  static const String githubId = "Dhanush623";
  static const String linkedInId = "dhanushrajamohan";
  static const String flutter = "Flutter";
  static const String reactNative = "React Native";
  static const String ionic = "Ionic v3";
  static const String ktor = "KTOR";
  static const String springBoot = "Spring Boot";
  static const String kotlin = "Kotlin";
  static const String html = "HTML";
  static const String css = "CSS";
  static const String js = "JavaScript";
  static const String ts = "TypeScript";
  static const String ror = "Ruby on Rails";
  static const String git = "Git";
  static const String elasticSearch = "Elastic Search";
  static const String redis = "Redis";
  static const String firebase = "Firebase";
  static const String flutterUrl = "https://flutter.dev/";
  static const String ionicUrl = "https://ionicframework.com/";
  static const String reactNativeUrl = "https://reactnative.dev/";
  static const String ktorUrl = "https://ktor.io/";
  static const String kotlinUrl = "https://kotlinlang.org/";
  static const String htmlUrl = "https://www.w3schools.com/html/";
  static const String cssUrl = "https://www.w3schools.com/css/";
  static const String jsUrl = "https://www.w3schools.com/js/";
  static const String tsUrl = "https://www.typescriptlang.org/";
  static const String rorUrl = "https://www.ruby-lang.org/en/s";
  static const String gitUrl = "https://git-scm.com/";
  static const String elasticSearchUrl = "https://www.elastic.co/elasticsearch";
  static const String redisUrl = "https://redis.io/";
  static const String firebaseUrl = "https://firebase.google.com/";
  static const String viewApplication = "View Application";
  static const String viewArticle = "View Article";
  static const String viewSource = "View Source";
  static const String finCalc = "FinCalc";
  static const String finCalcUrl =
      "https://play.google.com/store/apps/details?id=com.softly.finance";
  static const String finCalcSourceUrl =
      "https://github.com/Dhanush623/fincalc";
  static const String totodo = "ToToDo";
  static const String totodoUrl =
      "https://play.google.com/store/apps/details?id=com.softly.todo";
  static const String totodoSourceUrl = "https://github.com/Dhanush623/ToToDo";
  static const String flutterWidget = "Flutter Widget";
  static const String flutterWidgetUrl =
      "https://www.linkedin.com/pulse/class-vs-function-flutter-widget-dhanush-rajamohan-bvbqc/?trackingId=QHOHdt3%2FTdiWgKJJ2gsehQ%3D%3D";
  static List<String> imageList = [AppAssets.image1, AppAssets.image2];
  static const String modeFullTime = "Full Time";
  static const String softwareEngnieerLevel1 = "Software Engnieer Level 1";
  static DateTime softwareEngnieerLevel1StartDate = DateTime(2021, 10, 20);
  static DateTime softwareEngnieerLevel1EndDate = DateTime(2022, 3, 31);
  static const String softwareEngnieerLevel2 = "Software Engnieer Level 2";
  static DateTime softwareEngnieerLevel2StartDate = DateTime(2022, 4, 1);
  static DateTime softwareEngnieerLevel2EndDate = DateTime(2023, 3, 31);
  static const String seniorSoftwareEngnieerLevel1 =
      "Senior Software Engnieer Level 1";
  static const String seniorSoftwareEngnieerLevel2 =
      "Senior Software Engnieer Level 2";
  static DateTime seniorSoftwareEngnieerLevel1StartDate = DateTime(2023, 4, 1);
  static DateTime seniorSoftwareEngnieerLevel2StartDate = DateTime(2024, 7, 30);
  static DateTime mxSeniorSoftwareEngineerLevel1EndDate = DateTime(2026, 2, 28);
  static DateTime mxSeniorSoftwareEngineerLevel2StartDate =
      DateTime(2026, 3, 1);
  static const String softwareEngnieer = "Software Engnieer";
  static DateTime softwareEngnieerStartDate = DateTime(2020, 10, 1);
  static const String softwareEngnieerTrainee = "Software Engnieer Trainee";
  static DateTime softwareEngnieerTraineeStartDate = DateTime(2019, 4, 1);
  static DateTime softwareEngnieerTraineeEndDate = DateTime(2020, 9, 30);
  static const String softwareDeveloperIntership =
      "Software Developer Internship";
  static DateTime softwareDeveloperIntershipStartDate = DateTime(2018, 5, 1);
  static DateTime softwareDeveloperIntershipEndDate = DateTime(2019, 3, 31);
  static const String atribs = "ATRIBS SOFTWARE SYSTEMS PVT LTD";
  static DateTime atribsStartDate = DateTime(2018, 5, 1);
  static DateTime atribsEndDate = DateTime(2021, 8, 19);
  static const String msf = "Market Simplified India Limited";
  static DateTime msfStartDate = DateTime(2021, 8, 20);
  static DateTime msfendDate = DateTime(2024, 7, 29);
  static String dateFormat = "dd/MMM/yyyy";
  static String current = "Current";
  static String chennai = "Chennai, Tamil Nadu";
  static const String mx = "MX Build Technologies India Pvt. Ltd";
  static DateTime mxStartDate = DateTime(2024, 7, 30);
  static List<MenuItem> menuList = [
    MenuItem(title: about),
    MenuItem(title: experience),
    MenuItem(title: myWorks),
    MenuItem(title: skills),
    MenuItem(title: contact),
  ];
  static List<MyWork> myWorkList = [
    MyWork(
      title: finCalc,
      source: finCalcUrl,
      buttonName: viewApplication,
      image: AppAssets.fincalc,
    ),
    MyWork(
      title: finCalc,
      source: finCalcSourceUrl,
      buttonName: viewSource,
      image: AppAssets.fincalc,
    ),
    MyWork(
      title: totodo,
      source: totodoUrl,
      buttonName: viewApplication,
      image: AppAssets.totodo,
    ),
    MyWork(
      title: totodo,
      source: totodoSourceUrl,
      buttonName: viewSource,
      image: AppAssets.totodo,
    ),
    MyWork(
      title: flutterWidget,
      source: flutterWidgetUrl,
      buttonName: viewArticle,
      image: AppAssets.linkedin,
    ),
  ];
  static List<Skill> skillList = [
    Skill(
      title: flutter,
      score: 80.0,
      iconUrl: AppAssets.flutter,
      url: flutterUrl,
    ),
    Skill(
        title: reactNative,
        score: 80.0,
        iconUrl: AppAssets.reactNative,
        url: reactNativeUrl),
    Skill(
      title: ktor,
      score: 70.0,
      iconUrl: AppAssets.ktor,
      url: ktorUrl,
    ),
    Skill(
      title: html,
      score: 60.0,
      iconUrl: AppAssets.html,
      url: htmlUrl,
    ),
    Skill(
      title: css,
      score: 50.0,
      iconUrl: AppAssets.css,
      url: cssUrl,
    ),
    Skill(
      title: js,
      score: 80.0,
      iconUrl: AppAssets.js,
      url: jsUrl,
    ),
    Skill(
      title: ts,
      score: 80.0,
      iconUrl: AppAssets.ts,
      url: tsUrl,
    ),
    Skill(
      title: git,
      score: 60.0,
      iconUrl: AppAssets.git,
      url: gitUrl,
    ),
    Skill(
      title: elasticSearch,
      score: 90.0,
      iconUrl: AppAssets.elasticSearch,
      url: elasticSearchUrl,
    ),
    Skill(
      title: redis,
      score: 100.0,
      iconUrl: AppAssets.redis,
      url: redisUrl,
    ),
    Skill(
      title: firebase,
      score: 70.0,
      iconUrl: AppAssets.firebase,
      url: firebaseUrl,
    ),
    Skill(
      title: ionic,
      score: 70.0,
      iconUrl: AppAssets.ionic,
      url: ionicUrl,
    ),
    Skill(
      title: ror,
      score: 50.0,
      iconUrl: AppAssets.ror,
      url: rorUrl,
    ),
  ];
  static List<ExperienceItem> experiences = [
    ExperienceItem(
      companyName: mx,
      startDate: mxStartDate,
      mode: modeFullTime,
      designations: [
        Designation(
          role: seniorSoftwareEngnieerLevel2,
          startDate: mxSeniorSoftwareEngineerLevel2StartDate,
          location: chennai,
          mode: modeFullTime,
          skills: [ts, ror],
        ),
        Designation(
          role: seniorSoftwareEngnieerLevel1,
          startDate: seniorSoftwareEngnieerLevel2StartDate,
          endDate: mxSeniorSoftwareEngineerLevel1EndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [ts],
        ),
      ],
    ),
    ExperienceItem(
      companyName: msf,
      startDate: msfStartDate,
      endDate: msfendDate,
      mode: modeFullTime,
      designations: [
        Designation(
          role: seniorSoftwareEngnieerLevel1,
          startDate: seniorSoftwareEngnieerLevel1StartDate,
          endDate: msfendDate,
          location: chennai,
          mode: modeFullTime,
          skills: [ktor, springBoot, redis, elasticSearch],
        ),
        Designation(
          role: softwareEngnieerLevel2,
          startDate: softwareEngnieerLevel2StartDate,
          endDate: softwareEngnieerLevel2EndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [reactNative],
        ),
        Designation(
          role: softwareEngnieerLevel1,
          startDate: softwareEngnieerLevel1StartDate,
          endDate: softwareEngnieerLevel1EndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [reactNative],
        ),
      ],
    ),
    ExperienceItem(
      companyName: atribs,
      startDate: atribsStartDate,
      endDate: atribsEndDate,
      mode: modeFullTime,
      designations: [
        Designation(
          role: softwareEngnieer,
          startDate: softwareEngnieerStartDate,
          endDate: atribsEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative],
        ),
        Designation(
          role: softwareEngnieerTrainee,
          startDate: softwareEngnieerTraineeStartDate,
          endDate: softwareEngnieerTraineeEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative],
        ),
        Designation(
          role: softwareDeveloperIntership,
          startDate: softwareDeveloperIntershipStartDate,
          endDate: softwareDeveloperIntershipEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative, ionic],
        ),
      ],
    ),
  ];
}
