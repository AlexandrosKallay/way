import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/temple.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/swing.jpg',
    name: 'Walking Tour and swing Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/beach.jpg',
    name: 'beach Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/bali.jpg',
    city: 'Bali',
    country: 'Indonesia',
    description: 'Visit Bali for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/santorini.jpg',
    city: 'Santorini',
    country: 'Greece',
    description: 'Visit Santorini for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/canaria.jpg',
    city: 'Gran Canaria',
    country: 'Spain',
    description: 'Visit New Gran Canaria for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/majorca.jpg',
    city: 'Majorca',
    country: 'Spain',
    description: 'Visit Majorca for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/Thailand.jpg',
    city: 'Bangkok',
    country: 'Thailand',
    description: 'Visit Bangkok for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];