import 'package:flutter/material.dart';
import 'package:workspaces/workspace_item.dart';

class WorkspaceCard extends StatelessWidget {
  final WorkspaceItem workspace;

  const WorkspaceCard({super.key, required this.workspace});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: workspace.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              workspace.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 2,
            right: 2,
            child: PopupMenuButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case 'edit':
                    break;
                  case 'delete':
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
