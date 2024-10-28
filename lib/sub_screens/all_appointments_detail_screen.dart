import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:medoloc/custom_widget/contact_buttons.dart';
import 'package:medoloc/custom_widget/doctor_info_card.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/sub_screens/patient_summar_%20card.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/favorite_button.dart';

class AllAppointmentsDetailScreen extends StatelessWidget {
  const AllAppointmentsDetailScreen({super.key});

  // Mocked file path for demonstration. Replace with actual file path.
  final String filePath = 'assets/images/image 758.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            MedoLocRow(),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 211,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  right: 16,
                  child: FavoriteButton(),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: Text(
                    "Manipal Hospital Bangalore",
                    style: semibold16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 85,
                        child: ButtonContact(
                          imagePath:
                              'assets/images/material-symbols-light_call.png', // Replace with your asset path
                          label: 'Call',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 135,
                        child: const ButtonContact(
                          imagePath:
                              'assets/images/ic_baseline-whatsapp.png', // Replace with your asset path
                          label: 'WhatsApp',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 115,
                        child: const ButtonContact(
                          imagePath:
                              'assets/images/mdi_web.png', // Replace with your asset path
                          label: 'Website',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // mdi_web.png
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const DoctorInfoCard(
                      name: 'Dr. Jenny',
                      specialty: 'Specialist Cardiologist',
                      lastSeen: '10 Days ago',
                      imageUrl: 'assets/images/Group 581.png',
                    ),
                    const SizedBox(height: 16),
                    const PatientSummaryCard(
                      summary:
                          'Imaging and biopsy results confirm the presence of '
                          'a 3 cm tumor in the left breast, with no lymph node '
                          'involvement. The recommended treatment plan includes surgery '
                          'followed by adjuvant chemotherapy and radiation therapy to '
                          'prevent recurrence.',
                    ),
                    const SizedBox(height: 16),
                    _buildDocumentViewer(filePath),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to render image or PDF based on file type
  Widget _buildDocumentViewer(String filePath) {
    if (filePath.endsWith('.pdf')) {
      // Display PDF
      return SizedBox(
        height: 193,
        width: 217,
        child: PDFView(
          filePath: filePath,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true,
          pageFling: true,
        ),
      );
    } else if (filePath.endsWith('.jpg') || filePath.endsWith('.png')) {
      // Display Image
      return Image.asset(
        filePath,
        height: 193,
        width: 217,
        fit: BoxFit.cover,
      );
    } else {
      return Text('Unsupported file format', style: medium15);
    }
  }
}
