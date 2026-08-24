import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;

/// A simple Markdown viewer widget that uses the `markdown` package
/// to parse and render markdown content as Flutter widgets.
class MarkdownViewer extends StatelessWidget {
  const MarkdownViewer({
    super.key,
    required this.data,
    this.selectable = false,
  });

  final String data;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final document = md.Document(extensionSet: md.ExtensionSet.gitHubFlavored);
    final nodes = document.parse(data);
    final widgets = _buildWidgets(context, nodes);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  List<Widget> _buildWidgets(BuildContext context, List<md.Node> nodes) {
    final List<Widget> widgets = [];
    for (final node in nodes) {
      final widget = _buildNode(context, node);
      if (widget != null) widgets.add(widget);
    }
    return widgets;
  }

  Widget? _buildNode(BuildContext context, md.Node node) {
    final theme = Theme.of(context);

    if (node is md.Element) {
      switch (node.tag) {
        case 'h1':
          return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: _buildRichText(
              context,
              node,
              theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        case 'h2':
          return Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 6),
            child: _buildRichText(
              context,
              node,
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          );
        case 'h3':
          return Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: _buildRichText(
              context,
              node,
              theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        case 'p':
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: _buildRichText(context, node, theme.textTheme.bodyMedium!),
          );
        case 'ul':
          return _buildList(context, node, ordered: false);
        case 'ol':
          return _buildList(context, node, ordered: true);
        case 'blockquote':
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: theme.colorScheme.primary, width: 4),
              ),
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildWidgets(context, node.children ?? []),
            ),
          );
        case 'hr':
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: theme.dividerColor),
          );
        case 'table':
          return _buildTable(context, node);
        default:
          return _buildRichText(context, node, theme.textTheme.bodyMedium!);
      }
    }
    return null;
  }

  Widget _buildTable(BuildContext context, md.Element table) {
    final theme = Theme.of(context);
    final rows = <TableRow>[];

    for (final section in table.children ?? []) {
      if (section is! md.Element) continue;
      final isHeader = section.tag == 'thead';

      for (final row in section.children ?? []) {
        if (row is! md.Element || row.tag != 'tr') continue;

        final cells = <Widget>[];
        for (final cell in row.children ?? []) {
          if (cell is! md.Element) continue;
          cells.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: _buildRichText(
                context,
                cell,
                isHeader
                    ? theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      )
                    : theme.textTheme.bodyMedium!,
              ),
            ),
          );
        }

        rows.add(
          TableRow(
            decoration: isHeader
                ? BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  )
                : null,
            children: cells,
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Table(
        border: TableBorder.all(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        children: rows,
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    md.Element node, {
    required bool ordered,
  }) {
    final theme = Theme.of(context);
    final items = <Widget>[];
    int index = 1;
    for (final child in node.children ?? []) {
      if (child is md.Element && child.tag == 'li') {
        final prefix = ordered ? '${index++}. ' : '• ';
        items.add(
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 2, bottom: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(prefix, style: theme.textTheme.bodyMedium),
                Expanded(
                  child: _buildRichText(
                    context,
                    child,
                    theme.textTheme.bodyMedium!,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }

  Widget _buildRichText(
    BuildContext context,
    md.Element element,
    TextStyle style,
  ) {
    final spans = _buildInlineSpans(element.children ?? [], style);
    final textSpan = TextSpan(children: spans);
    if (selectable) {
      return SelectableText.rich(textSpan);
    }
    return RichText(text: textSpan);
  }

  List<InlineSpan> _buildInlineSpans(List<md.Node> nodes, TextStyle baseStyle) {
    final spans = <InlineSpan>[];
    for (final node in nodes) {
      if (node is md.Text) {
        spans.add(
          TextSpan(text: _decodeHtmlEntities(node.text), style: baseStyle),
        );
      } else if (node is md.Element) {
        switch (node.tag) {
          case 'strong':
            spans.addAll(
              _buildInlineSpans(
                node.children ?? [],
                baseStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          case 'em':
            spans.addAll(
              _buildInlineSpans(
                node.children ?? [],
                baseStyle.copyWith(fontStyle: FontStyle.italic),
              ),
            );
          case 'code':
            spans.addAll(
              _buildInlineSpans(
                node.children ?? [],
                baseStyle.copyWith(
                  fontFamily: 'monospace',
                  backgroundColor: Colors.grey.withValues(alpha: 0.2),
                ),
              ),
            );
          case 'p':
            spans.addAll(_buildInlineSpans(node.children ?? [], baseStyle));
          default:
            spans.addAll(_buildInlineSpans(node.children ?? [], baseStyle));
        }
      }
    }
    return spans;
  }

  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'");
  }
}
