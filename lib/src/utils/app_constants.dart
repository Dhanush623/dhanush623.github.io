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
      "A software engineer with over ${DateService().getExperienceYears().years} years ${DateService().getExperienceYears().months} months in the industry. My expertise spans both frontend and middleware development, so I can craft engaging user interfaces and wire them up to robust backend systems.";
  static const String greeting = "Hello, I'm";
  static const String basedIn = "Chennai, India";
  static const String getInTouch = "Get in touch";
  static const String viewGithub = "GitHub";
  static const String viewLinkedIn = "LinkedIn";
  static const String phone = "Phone";
  static const String email = "Email";
  static const String github = "GitHub";
  static const String linkedIn = "LinkedIn";

  // Section eyebrow labels and descriptions.
  static const String aboutLabel = "01 / About";
  static const String aboutTitle = "A bit about me";
  static const String experienceTitle = "Where I have worked";
  static const String experienceLabelTag = "02 / Career";
  static const String experienceSubtitle =
      "Roles and the stacks I shipped with along the way.";
  static const String myWorksLabel = "03 / Projects";
  static const String myWorksTitle = "Things I have built";
  static const String myWorksSubtitle =
      "Apps on the Play Store and writing I have published.";
  static const String skillsLabel = "04 / Toolbox";
  static const String skillsTitle = "Tech I work with";
  static const String skillsSubtitle =
      "Tap any card to read more about the technology.";
  static const String contactLabel = "05 / Contact";
  static const String contactTitle = "Let's build something";
  static const String contactSubtitle =
      "The quickest way to reach me is email — I reply to everything.";
  static const String backToTop = "Back to top";
  static const String toggleTheme = "Toggle light / dark theme";

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
  static const String softwareEngineerLevel1 = "Software Engineer Level 1";
  static DateTime softwareEngineerLevel1StartDate = DateTime(2021, 10, 20);
  static DateTime softwareEngineerLevel1EndDate = DateTime(2022, 3, 31);
  static const String softwareEngineerLevel2 = "Software Engineer Level 2";
  static DateTime softwareEngineerLevel2StartDate = DateTime(2022, 4, 1);
  static DateTime softwareEngineerLevel2EndDate = DateTime(2023, 3, 31);
  static const String seniorSoftwareEngineerLevel1 =
      "Senior Software Engineer Level 1";
  static const String seniorSoftwareEngineerLevel2 =
      "Senior Software Engineer Level 2";
  static DateTime seniorSoftwareEngineerLevel1StartDate = DateTime(2023, 4, 1);
  static DateTime seniorSoftwareEngineerLevel2StartDate = DateTime(2024, 7, 30);
  static DateTime mxSeniorSoftwareEngineerLevel1EndDate = DateTime(2026, 2, 28);
  static DateTime mxSeniorSoftwareEngineerLevel2StartDate =
      DateTime(2026, 3, 1);
  static const String softwareEngineer = "Software Engineer";
  static DateTime softwareEngineerStartDate = DateTime(2020, 10, 1);
  static const String softwareEngineerTrainee = "Software Engineer Trainee";
  static DateTime softwareEngineerTraineeStartDate = DateTime(2019, 4, 1);
  static DateTime softwareEngineerTraineeEndDate = DateTime(2020, 9, 30);
  static const String softwareDeveloperInternship =
      "Software Developer Internship";
  static DateTime softwareDeveloperInternshipStartDate = DateTime(2018, 5, 1);
  static DateTime softwareDeveloperInternshipEndDate = DateTime(2019, 3, 31);
  static const String atribs = "ATRIBS SOFTWARE SYSTEMS PVT LTD";
  static DateTime atribsStartDate = DateTime(2018, 5, 1);
  static DateTime atribsEndDate = DateTime(2021, 8, 19);
  static const String msf = "Market Simplified India Limited";
  static DateTime msfStartDate = DateTime(2021, 8, 20);
  static DateTime msfendDate = DateTime(2024, 7, 29);
  static String dateFormat = "MMM yyyy";
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
          role: seniorSoftwareEngineerLevel2,
          startDate: mxSeniorSoftwareEngineerLevel2StartDate,
          location: chennai,
          mode: modeFullTime,
          skills: [ts, ror],
        ),
        Designation(
          role: seniorSoftwareEngineerLevel1,
          startDate: seniorSoftwareEngineerLevel2StartDate,
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
          role: seniorSoftwareEngineerLevel1,
          startDate: seniorSoftwareEngineerLevel1StartDate,
          endDate: msfendDate,
          location: chennai,
          mode: modeFullTime,
          skills: [ktor, springBoot, redis, elasticSearch],
        ),
        Designation(
          role: softwareEngineerLevel2,
          startDate: softwareEngineerLevel2StartDate,
          endDate: softwareEngineerLevel2EndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [reactNative],
        ),
        Designation(
          role: softwareEngineerLevel1,
          startDate: softwareEngineerLevel1StartDate,
          endDate: softwareEngineerLevel1EndDate,
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
          role: softwareEngineer,
          startDate: softwareEngineerStartDate,
          endDate: atribsEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative],
        ),
        Designation(
          role: softwareEngineerTrainee,
          startDate: softwareEngineerTraineeStartDate,
          endDate: softwareEngineerTraineeEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative],
        ),
        Designation(
          role: softwareDeveloperInternship,
          startDate: softwareDeveloperInternshipStartDate,
          endDate: softwareDeveloperInternshipEndDate,
          location: chennai,
          mode: modeFullTime,
          skills: [flutter, reactNative, ionic],
        ),
      ],
    ),
  ];
}
