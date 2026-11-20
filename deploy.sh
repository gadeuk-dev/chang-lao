#!/usr/bin/env bash
# 올리기: 버전 번호를 지금 시각으로 바꾸고(폰이 새 버전을 알아채게) 커밋·푸시
# 쓰는 법: bash deploy.sh "바꾼 내용 한 줄"
set -e
cd "$(dirname "$0")"
V=$(date +%Y%m%d-%H%M)
sed -i "s/^const APP_V = '[^']*';/const APP_V = '$V';/" index.html
printf '%s\n' "$V" > version.txt
git add -A
git commit -q -m "${1:-업데이트} (v$V)

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"
git push -q origin main
echo "올림: v$V"
