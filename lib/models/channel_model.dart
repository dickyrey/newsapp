class ChannelModel {
  final int id;
  final String logo;
  final String name;
  final String bannerImage;
  final String website;

  ChannelModel({this.name, this.id, this.logo, this.bannerImage, this.website});
}

List<ChannelModel> channelList = [
  ChannelModel(
    id: 1,
    name: 'BBC News',
    logo: 'assets/images/bbc_news.jpg',
    bannerImage:
        'https://i.pinimg.com/564x/52/96/e4/5296e4a72268277089c1b7a4999acd91.jpg',
    website: 'bbc.com',
  ),
  ChannelModel(
    id: 2,
    name: 'CBS News',
    logo: 'assets/images/cbs.png',
    bannerImage:
        'https://cbsnews3.cbsistatic.com/hub/i/r/2018/08/01/02bd502e-6910-416e-9422-ab17d03e33fb/thumbnail/1280x720/3d204e46b25a30d1298d795660e084bd/cbsn-h-blue.jpg',
    website: 'cbsnews.com',
  ),
  ChannelModel(
    id: 3,
    name: 'CNBC News',
    logo: 'assets/images/cnbc.jpg',
    bannerImage:
        'https://www.talkesport.com/wp-content/uploads/CNBC-Logo-Redesign.jpg',
    website: 'cnbc.com',
  ),
  ChannelModel(
    id: 4,
    name: 'CNN News',
    logo: 'assets/images/cnn.jpg',
    bannerImage:
        'https://cdn.cnn.com/cnnnext/dam/assets/170711161429-happening-now-16x9-artwork-full-169.jpg',
    website: 'cnn.com',
  ),
  ChannelModel(
    id: 5,
    name: 'Engadget',
    logo: 'assets/images/engadget.jpg',
    bannerImage:
        'https://i.pinimg.com/originals/28/15/8b/28158bd45a07019da19334715d41dd01.jpg',
    website: 'engadget.com',
  ),
  ChannelModel(
    id: 6,
    name: 'ESPN',
    logo: 'assets/images/espn.jpg',
    bannerImage: 'https://wallpapercave.com/wp/wp3642073.jpg',
    website: 'espn.com',
  ),
  ChannelModel(
    id: 7,
    name: 'Tech Crunch',
    logo: 'assets/images/techcrunch.png',
    bannerImage:
        'https://www.kenyancollective.com/wp-content/uploads/2017/10/Kenyan-Collective-Techcrunch-Battlefield.jpg',
    website: 'techcrunch.com',
  ),
];
