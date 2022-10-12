import 'package:be_mine/models/place_model.dart';
import 'package:be_mine/models/trip_model.dart';
import 'package:latlong2/latlong.dart';

var imageList = [
  "https://images.unsplash.com/photo-1575177990047-1a6a4d211486?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8X2hiLWRsNFEtNFV8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1656502655405-216923c36bcb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDExfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1556911073-52527ac43761?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEzfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1535473895227-bdecb20fb157?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0fF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1653938245506-3203e63338b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM4fF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1653576840776-47a12be506e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQwfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1575177990047-1a6a4d211486?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8X2hiLWRsNFEtNFV8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1656502655405-216923c36bcb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDExfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1556911073-52527ac43761?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDEzfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1535473895227-bdecb20fb157?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0fF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1653938245506-3203e63338b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM4fF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1653576840776-47a12be506e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQwfF9oYi1kbDRRLTRVfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
];

var tripListFake = [
  Trip(
    id: 1.toString(),
    latLng: LatLng(51.502, -0.09),
    thumbnail: imageList[1],
    images: imageList,
    title: 'Trip Ho',
  ),
  Trip(
    id: 2.toString(),
    latLng: LatLng(51.5112, -0.101),
    thumbnail: imageList[2],
    images: imageList,
    title: 'Mountain',
  ),
  Trip(
    id: 3.toString(),
    latLng: LatLng(51.5001, -0.103),
    thumbnail: imageList[3],
    images: imageList,
    title: 'Jasad',
  ),
  Trip(
    id: 4.toString(),
    latLng: LatLng(53.5112, -0.101),
    thumbnail: imageList[4],
    images: imageList,
    title: 'Dousaro',
  ),
  Trip(
    id: 5.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[5],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 6.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[2],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 7.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[9],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 8.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[1],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 9.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[2],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 10.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[10],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 11.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[11],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 12.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[4],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 13.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[3],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 14.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[7],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 15.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[11],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 16.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[10],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 17.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[9],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 18.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[1],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 19.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[4],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 20.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[2],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 21.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[11],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 22.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[5],
    images: imageList,
    title: 'Kamorop',
  ),
  Trip(
    id: 23.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[9],
    images: imageList,
    title: 'Kamorop',
  )
];

var placeListFake = [
  Place(
    id: 1.toString(),
    latLng: LatLng(51.502, -0.09),
    thumbnail: imageList[9],
    images: imageList,
    title: 'Trip Ho',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  Place(
    id: 2.toString(),
    latLng: LatLng(51.5112, -0.101),
    thumbnail: imageList[2],
    images: imageList,
    title: 'Mountain',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  Place(
    id: 3.toString(),
    latLng: LatLng(51.5001, -0.103),
    thumbnail: imageList[5],
    images: imageList,
    title: 'Jasad',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  Place(
    id: 4.toString(),
    latLng: LatLng(53.5112, -0.101),
    thumbnail: imageList[7],
    images: imageList,
    title: 'Dousaro',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  Place(
    id: 5.toString(),
    latLng: LatLng(52.5001, -0.103),
    thumbnail: imageList[5],
    images: imageList,
    title: 'Kamorop',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  )
];
