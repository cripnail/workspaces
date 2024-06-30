import 'package:flutter/material.dart';
import 'package:workspaces/workspace_card.dart';
import 'package:workspaces/workspace_item.dart';

class WorkspacesPage extends StatelessWidget {
  WorkspacesPage({super.key});

  final List<WorkspaceItem> workspaces = [
    WorkspaceItem('Savva', Colors.pink),
    WorkspaceItem('Olluco', Colors.pink[300]!),
    WorkspaceItem('Loona', Colors.blue),
    WorkspaceItem('Folk', Colors.lightBlue),
    WorkspaceItem('White Rabbit', Colors.teal),
    WorkspaceItem('Sage', Colors.green),
    WorkspaceItem('Maya', Colors.yellow),
    WorkspaceItem('Jun', Colors.orange),
    WorkspaceItem('Onest', Colors.purple),
    WorkspaceItem('Probka na Цветном', Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.settings_outlined, size: 30),
            onPressed: () {},
          ),
          title: const Text('Рабочие пространства'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[600]!),
                  ),
                  fillColor: Colors.grey[900],
                  filled: true,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  if (constraints.maxWidth < 600) {
                    crossAxisCount = 2;
                  } else if (constraints.maxWidth < 900) {
                    crossAxisCount = 3;
                  } else {
                    crossAxisCount = 4;
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(6),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 1.7,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: workspaces.length,
                    itemBuilder: (context, index) {
                      return WorkspaceCard(workspace: workspaces[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
