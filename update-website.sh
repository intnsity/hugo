#! /bin/bash
if [ -d "./public/*" ]; then
  rm -r ./public/*
fi
cp -r ./hugo-site/public/* public/
