import 'package:get/get.dart';

import '../../core/utils/app_assets.dart';
import '../../view/components/appointment_components/doctor_card.dart';

class AppointmentController extends GetxController {
  RxInt slotCount = 0.obs;
  var date = DateTime.now().obs;

  var selectedDate = Rxn<DateTime>(); // Use Rxn for nullable DateTime
  var selectedSlot = "".obs;

  void selectSlot(String slot, DateTime date) {
    if (slot.substring(0, 2) != 'No') {
      slotCount.value = int.tryParse(slot.substring(0, 2))!;
      selectedDate.value = date; // ✅ Update the observable value
      selectedSlot.value = slot;
    } else {
      slotCount.value = 0;
      selectedDate.value = date; // ✅ Update the observable value
      selectedSlot.value = "";
    }
  }

  List<DoctorCard> doctorList = [
    DoctorCard(
      speciality: 'Dermatology',
      name: 'Dr. Sarah Adams',
      image: AppAssets.doctorFemaleImage1,
    ),
    DoctorCard(
      speciality: 'Ophthalmology',
      name: 'Dr. David Brown',
      image: AppAssets.doctorMaleImage3,
    ),
    DoctorCard(
      speciality: 'Orthopedics',
      name: 'Dr. Michael Lee',
      image: AppAssets.doctorMaleImage4,
    ),
    DoctorCard(
      speciality: 'General physician',
      name: 'Dr. James Wilson',
      image: AppAssets.doctorImage,
    ),
  ];
}
