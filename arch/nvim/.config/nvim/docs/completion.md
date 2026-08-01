# Completion

## Purpose

The completion layer provides IDE-style suggestions while typing.

Current stack:

```bash

blink.cmp
|
+-- completion UI
+-- suggestion engine

LuaSnip
|
+-- snippet expansion

```

## Sources

Current completion sources:

- LSP
- filesystem paths
- snippets
- current buffer

## Design

Completion is configured independently from LSP.

This allows:

- testing completion before language servers exist
- easier debugging
- smaller configuration modules
