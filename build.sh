#!/bin/sh
# vilka.html is the artifact source (no <head>); build the full page for GitHub Pages and the desktop copy.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="ru">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<meta name="apple-mobile-web-app-capable" content="yes">\n<meta name="apple-mobile-web-app-title" content="Вилка">\n<style>body{margin:0}</style>\n'
  printf '<script>if ("serviceWorker" in navigator) navigator.serviceWorker.register("sw.js").catch(() => {});</script>\n'
  cat vilka.html
  printf '\n</html>\n'
} > index.html
cp index.html "Калькулятор вилок.html"
