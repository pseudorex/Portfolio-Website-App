class ProjectUtils {
  final String image;
  final String title;
  final String subtitile;
  final String? androidLink;
  final String? webLink;
  final String? iosLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitile,
    this.androidLink,
    this.webLink,
    this.iosLink,
  });
}

List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
    image: 'assets/images/project1.jpg',
    title: 'abc',
    subtitile: '123',

  ),
  ProjectUtils(
    image: 'assets/images/project2.jpg',
    title: 'def',
    subtitile: '456',
  ),
];

List<ProjectUtils> workProjects = [
  ProjectUtils(
    image: 'assets/images/project3.jpg',
    title: 'ghi',
    subtitile: '789',
    webLink: 'https://leetcode.com/u/Asmitrex/',
  ),
  ProjectUtils(
    image: 'assets/images/project4.jpg',
    title: 'jkl',
    subtitile: '101112',
  ),
  ProjectUtils(
    image: 'assets/images/project3.jpg',
    title: 'ghi',
    subtitile: '789',
    webLink: 'https://leetcode.com/u/Asmitrex/',
  ),
  ProjectUtils(
    image: 'assets/images/project4.jpg',
    title: 'jkl',
    subtitile: '101112',
  ),ProjectUtils(
    image: 'assets/images/project3.jpg',
    title: 'ghi',
    subtitile: '789',
    webLink: 'https://leetcode.com/u/Asmitrex/',
  ),
  ProjectUtils(
    image: 'assets/images/project4.jpg',
    title: 'jkl',
    subtitile: '101112',
  ),
];
