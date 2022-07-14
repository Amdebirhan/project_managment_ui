part of dashboard;

class DashboardController extends GetxController {
  // Data
  ProjectCardData getSelectedProject() {
    return ProjectCardData(
        projectImage: const AssetImage(ImageRasterPath.logo1),
        projectName: "Marketplace Mobile",
        releaseTime: DateTime.now(),
        percent: .3);
  }
}
