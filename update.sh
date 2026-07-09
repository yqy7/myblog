#!/bin/bash

echo "# 博客文章列表" > README.md
echo "" >> README.md

# macOS 使用 stat -f '%B' 获取创建时间
for file in $(find myblog -maxdepth 1 -name "*.md" -type f -exec stat -f '%B %N' {} \; | sort -nr | cut -d' ' -f2-); do
    title=$(basename "$file" .md)
    echo "- [$title](./$file)" >> README.md
done