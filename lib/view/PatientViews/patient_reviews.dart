import 'package:flutter/material.dart';

class PatientReviews extends StatelessWidget {
  final reviews;
  const PatientReviews({super.key, this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
      ),
      body: Column(
        children: [
          reviews.isEmpty
              ? const Center(
                  child: Text("Doctor have no review"),
                )
              : ListView.builder(
                  itemCount: reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final review = reviews[index];

                    return ReviewWidget(
                        patientName: review.patientName,
                        patientEmail: review.patienEmail,
                        comment: review.comment,
                        date: DateTime.parse(review.createdAt),
                        rating: review.rating);
                  },
                )
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  final String patientName;
  final String patientEmail;
  final String comment;
  final DateTime date;
  final int rating;

  const ReviewWidget({
    Key? key,
    required this.patientName,
    required this.patientEmail,
    required this.comment,
    required this.date,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Name and Email
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  patientName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${date.day}/${date.month}/${date.year}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              patientEmail,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            // Rating Stars
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < rating ? Colors.yellow[700] : Colors.grey[300],
                  size: 20,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Comment
            Text(
              comment,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
