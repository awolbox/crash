#!/bin/env sh
#
# TODO:
#	python guizero warning dialogs
#	ranger open
#

TRASH_DIRECTORY="${BLOCK_INSTANCE}"

if [ "${TRASH_DIRECTORY}" = "" ]; then
  TRASH_DIRECTORY=${HOME}/.local/share/Trash
fi

if [[ "${BLOCK_BUTTON}" -eq 3 ]];		# Right-click (delete)
then
  rm -rf "${TRASH_DIRECTORY}/files"
  rm -rf "${TRASH_DIRECTORY}/info"
  mkdir "${TRASH_DIRECTORY}/files"
  mkdir "${TRASH_DIRECTORY}/info"
fi

TRASH_COUNT=$(ls -U -1 "${TRASH_DIRECTORY}/files" | wc -l)
URGENT_VALUE=30
echo "${TRASH_COUNT}"
echo "${TRASH_COUNT}"
echo ""

if [[ "${TRASH_COUNT}" -ge "${URGENT_VALUE}" ]]; then
  exit 31
fi

