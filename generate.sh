#!/bin/bash
FILES=vendor/github.com/cubex/proto/*.proto
for f in $FILES
do
  file=$(basename "$f")
  package="${file%.*}"
  echo "Processing $package $f"
  mkdir -p $package
  protoc -I vendor/github.com/cubex/proto --go_out=plugins=grpc:../../../ $f
  git add $package/*
done