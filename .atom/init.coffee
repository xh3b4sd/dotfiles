# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

{Point} = require 'atom'

getIndent = (editor, row) ->
  lineText = editor.lineTextForBufferRow(row)
  return -1 if not lineText
  if lineText.match(/^\s*$/)
    0
  else
    editor.indentationForBufferRow(row)

handleEvent = (editor, moveToNextFold) ->
  currentLine = editor.bufferPositionForScreenPosition(editor.getCursorScreenPosition()).row
  foldOpen = false
  lastIndentation = 0
  foldPositions = []

  for line in [0..editor.getLineCount()]
    indentation = getIndent editor, line
    if lastIndentation is 0 and indentation > 0
      foldOpen = true
    else
      foldOpen = false
    foldPositions.push line if foldOpen
    lastIndentation = indentation

  start = 0
  if not moveToNextFold
    start = editor.getLineCount()
    foldPositions = foldPositions.reverse()

  nextLine = start
  for line in foldPositions
    nextLine = line
    if moveToNextFold
      break if line-1 > currentLine
    else
      break if line < currentLine

  editor.setCursorScreenPosition(new Point(nextLine-1, 0))

atom.commands.add 'atom-text-editor', 'custom:move-to-next-fold', ->
  editor = atom.workspace.getActiveTextEditor()
  return if not editor
  handleEvent editor, true

atom.commands.add 'atom-text-editor', 'custom:move-to-prev-fold', ->
  editor = atom.workspace.getActiveTextEditor()
  return if not editor
  handleEvent editor, false
