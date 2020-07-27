class ProgramModel {
  final int id;
  final String logo;
  final String name;
  final String bannerImage;
  final String url;

  ProgramModel({this.name, this.id, this.logo, this.bannerImage, this.url});
}

List<ProgramModel> programList = [
  ProgramModel(
    id: 1,
    name: 'BBC News',
    logo: 'assets/images/bbc_news.jpg',
    bannerImage:
        'https://i.pinimg.com/564x/52/96/e4/5296e4a72268277089c1b7a4999acd91.jpg',
    url:
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 2,
    name: 'CBS News',
    logo: 'assets/images/cbs.png',
    bannerImage:
        'https://cbsnews3.cbsistatic.com/hub/i/r/2018/08/01/02bd502e-6910-416e-9422-ab17d03e33fb/thumbnail/1280x720/3d204e46b25a30d1298d795660e084bd/cbsn-h-blue.jpg',
    url:
        'https://newsapi.org/v2/top-headlines?sources=cbc-news&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 3,
    name: 'CNBC News',
    logo: 'assets/images/cnbc.jpg',
    bannerImage:
        'https://www.talkesport.com/wp-content/uploads/CNBC-Logo-Redesign.jpg',
    url:
        'https://newsapi.org/v2/everything?domains=cnbc.com&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 4,
    name: 'CNN News',
    logo: 'assets/images/cnn.jpg',
    bannerImage:
        'https://cdn.cnn.com/cnnnext/dam/assets/170711161429-happening-now-16x9-artwork-full-169.jpg',
    url:
        'http://newsapi.org/v2/everything?domains=cnn.com&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 5,
    name: 'Engadget',
    logo: 'assets/images/engadget.jpg',
    bannerImage:
        'https://i.pinimg.com/originals/28/15/8b/28158bd45a07019da19334715d41dd01.jpg',
    url:
        'http://newsapi.org/v2/everything?domains=engadget.com&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 6,
    name: 'ESPN',
    logo: 'assets/images/espn.jpg',
    bannerImage: 'https://wallpapercave.com/wp/wp3642073.jpg',
    url:
        'http://newsapi.org/v2/everything?domains=espn.com&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
  ProgramModel(
    id: 7,
    name: 'Tech Crunch',
    logo: 'assets/images/techcrunch.png',
    bannerImage:
        'https://www.kenyancollective.com/wp-content/uploads/2017/10/Kenyan-Collective-Techcrunch-Battlefield.jpg',
    url:
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1ae2d88a2b2d41afabffb03c92ea1c55',
  ),
];
