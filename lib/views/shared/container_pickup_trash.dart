import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ContainerPickUpTrash extends StatelessWidget {
  const ContainerPickUpTrash({
    super.key,
    required this.title,
    required this.status,
    required this.percentage,
    required this.color,
    required this.boxcolor,
  });

  final String title;
  final String status;
  final Color color;
  final Color boxcolor;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: boxcolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [const Center(child: CircleAvatar(radius: 24, child: Icon(Icons.delete),),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return LinearPercentIndicator(
                          width: constraints.maxWidth,
                          animation: true,
                          animationDuration: 2500,
                          lineHeight: 8.0,
                          percent: percentage / 100,
                          progressColor: color,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$percentage%',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
