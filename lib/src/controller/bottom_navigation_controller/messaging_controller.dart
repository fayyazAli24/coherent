import 'package:coherent/src/view/components/messagin_components/contact_card.dart';
import 'package:get/get.dart';

import '../../core/utils/app_assets.dart';
import '../../model/message_model.dart';

class MessaginController extends GetxController {
  var doctorName;

  List<ContactCard> doctorList = [
    ContactCard(doctorName: 'Dr. James Wilson', imagePath: AppAssets.doctorImage, medicineType: 'Cardiology'),
    ContactCard(doctorName: 'Dr. Sarah Adams', imagePath: AppAssets.doctorFemaleImage1, medicineType: 'Dermatology'),
    ContactCard(doctorName: 'Dr. David Brown', imagePath: AppAssets.doctorMaleImage3, medicineType: 'Ophthalmology'),
    ContactCard(doctorName: "Dr. Michael Lee", imagePath: AppAssets.doctorMaleImage4, medicineType: 'Orthopedics'),
  ];

  List<ContactCard> nurseList = [
    ContactCard(doctorName: 'Ellie Anderson', imagePath: AppAssets.nurseImage1, medicineType: 'Day Care'),
    ContactCard(doctorName: 'Emma White', imagePath: AppAssets.nurseImage2, medicineType: 'Fertility'),
    ContactCard(doctorName: 'Sara Watson', imagePath: AppAssets.nurseImage3, medicineType: 'Emergency'),
  ];

  var messages = <Message>[];
}
