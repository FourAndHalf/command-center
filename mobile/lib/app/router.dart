import 'package:go_router/go_router.dart';

import '../features/today/today_screen.dart';
import '../features/decisions/decisions_list_screen.dart';
import '../features/decisions/decision_detail_screen.dart';
import '../features/decisions/decision_capture_screen.dart';
import '../features/goals/goals_list_screen.dart';
import '../features/goals/goal_detail_screen.dart';
import '../features/reviews/reviews_screen.dart';
import '../features/reviews/review_workflow_screen.dart';
import '../features/timeline/timeline_screen.dart';
import '../features/search/search_screen.dart';
import '../features/people/people_screen.dart';
import '../features/insights/insights_screen.dart';
import '../features/reflection/reflection_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/projects/projects_list_screen.dart';
import '../features/projects/project_capture_screen.dart';
import '../features/projects/project_detail_screen.dart';
import '../features/projects/project_decision_review_screen.dart';
import '../features/projects/project_weekly_comparison_screen.dart';
import '../features/splash/splash_screen.dart';
import 'app_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (_, _) => const SplashScreen()),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(path: '/today', builder: (_, _) => const TodayScreen()),
        GoRoute(
          path: '/decisions',
          builder: (_, _) => const DecisionsListScreen(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, _) => const DecisionCaptureScreen(),
            ),
            GoRoute(
              path: ':id',
              builder: (_, state) =>
                  DecisionDetailScreen(decisionId: state.pathParameters['id']!),
            ),
          ],
        ),
        GoRoute(
          path: '/goals',
          builder: (_, _) => const GoalsListScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (_, state) =>
                  GoalDetailScreen(goalId: state.pathParameters['id']!),
            ),
          ],
        ),
        GoRoute(
          path: '/reviews',
          builder: (_, _) => const ReviewsScreen(),
          routes: [
            GoRoute(
              path: ':scheduleId',
              builder: (_, state) => ReviewWorkflowScreen(
                scheduleId: state.pathParameters['scheduleId']!,
              ),
            ),
          ],
        ),
        GoRoute(path: '/timeline', builder: (_, _) => const TimelineScreen()),
        GoRoute(
          path: '/projects',
          builder: (_, _) => const ProjectsListScreen(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, _) => const ProjectCaptureScreen(),
            ),
            GoRoute(
              path: ':id',
              builder: (_, state) =>
                  ProjectDetailScreen(projectId: state.pathParameters['id']!),
              routes: [
                GoRoute(
                  path: 'compare',
                  builder: (_, state) => ProjectWeeklyComparisonScreen(
                    projectId: state.pathParameters['id']!,
                  ),
                ),
                GoRoute(
                  path: 'review',
                  builder: (_, state) => ProjectDecisionReviewScreen(
                    projectId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(path: '/search', builder: (_, _) => const SearchScreen()),
        GoRoute(path: '/people', builder: (_, _) => const PeopleScreen()),
        GoRoute(path: '/insights', builder: (_, _) => const InsightsScreen()),
        GoRoute(
          path: '/reflection',
          builder: (_, _) => const ReflectionScreen(),
        ),
        GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
      ],
    ),
  ],
);
