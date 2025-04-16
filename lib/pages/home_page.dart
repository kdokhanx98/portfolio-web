import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/project.dart';
import '../services/project_service.dart';
import '../widgets/project_card.dart';

class HomePage extends StatelessWidget {
  final ProjectService _projectService = ProjectService();

  HomePage({super.key});

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 800) return 1; // Mobile
    if (width < 1200) return 2; // Tablet
    if (width < 1600) return 3; // Desktop
    return 4; // Large Desktop
  }

  double _getHorizontalPadding(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 800) return 16.0;
    if (width < 1200) return 32.0;
    return 48.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'My Portfolio',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withAlpha(204),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: _getHorizontalPadding(context),
              vertical: 24.0,
            ),
            sliver: FutureBuilder<List<Project>>(
              future: _projectService.getProjects(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (snapshot.hasError) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                }

                final projects = snapshot.data ?? [];

                return SliverMasonryGrid.count(
                  crossAxisCount: _getCrossAxisCount(context),
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  itemBuilder: (context, index) {
                    return ProjectCard(project: projects[index]);
                  },
                  childCount: projects.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
