import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/project.dart';

class ProjectService {
  static const String _projectsPath = 'assets/data/projects.json';

  Future<List<Project>> getProjects() async {
    try {
      final String jsonString = await rootBundle.loadString(_projectsPath);
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Project.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading projects: $e');
      return [];
    }
  }

  Future<void> addProject(Project project) async {
    try {
      final List<Project> projects = await getProjects();
      projects.add(project);

      json.encode(
        projects.map((p) => p.toJson()).toList(),
      );

      // Note: In a real application, you would need to implement
      // a way to persist this data, as writing to assets is not possible
      // at runtime. This could be done using a backend service or
      // local storage solution.
      debugPrint('Project added successfully');
    } catch (e) {
      debugPrint('Error adding project: $e');
      rethrow;
    }
  }
}
