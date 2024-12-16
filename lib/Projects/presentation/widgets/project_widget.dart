import 'package:flutter/material.dart';
import 'package:portfolio_web/Projects/data/model/projectmodel.dart';
import 'package:portfolio_web/Projects/data/model/projectsData.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/utilities/url_launcher_util.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleFontSize = size.width < 600 ? 24.0 : 32.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double horizontalPadding = constraints.maxWidth < 600
            ? 16.0 // Mobile
            : constraints.maxWidth < 1100
                ? 48.0 // Tablet
                : 80.0; // Desktop

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: GradientText(
                  "Projects",
                  colors: const [AppColors.studio, AppColors.paleSlate],
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            if (constraints.maxWidth >= 1100)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 4 / 3,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) => ProjectCard(
                  project: projects[index],
                ),
              )
            else if (constraints.maxWidth >= 700)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 4 / 3,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) => ProjectCard(
                  project: projects[index],
                ),
              )
            else
              Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.9,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) => ProjectCard(
                      project: projects[index],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.ebony,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.studio.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(project.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              project.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Text(
                project.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () => URLLauncher.launchURL(project.githubUrl),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Show on GitHub",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.yellowAccent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
