part of dashboard;

class _Sidebar extends StatelessWidget {
  const _Sidebar({Key? key, required this.data}) : super(key: key);

  final ProjectCardData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: ProjectCard(data: data),
            ),
            const Divider(
              thickness: 1,
            ),
            SelectionButton(
                initialSelected: 0,
                data: [
                  SelectionButtonData(
                    activeIcon: EvaIcons.grid,
                    icon: EvaIcons.gridOutline,
                    lable: "Dashboard",
                  ),
                  SelectionButtonData(
                      activeIcon: EvaIcons.archive,
                      icon: EvaIcons.archiveOutline,
                      lable: "Reports"),
                  SelectionButtonData(
                      activeIcon: EvaIcons.calendar,
                      icon: EvaIcons.calendarOutline,
                      lable: "Calender"),
                  SelectionButtonData(
                      activeIcon: EvaIcons.email,
                      icon: EvaIcons.emailOutline,
                      lable: "Email"),
                  SelectionButtonData(
                      activeIcon: EvaIcons.person,
                      icon: EvaIcons.personOutline,
                      lable: "profile"),
                  SelectionButtonData(
                      activeIcon: EvaIcons.settings,
                      icon: EvaIcons.settingsOutline,
                      lable: "Setting")
                ],
                onSelected: (index, value) {
                  print(value.lable);
                }),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: kSpacing * 2,
            ),
            UpgradePremiumCard(
              onPressed: () {},
              backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
            ),
            const SizedBox(
              height: kSpacing,
            )
          ],
        ),
      ),
    );
  }
}
